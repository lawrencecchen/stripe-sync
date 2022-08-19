// class XodInterface {
//   private _type: string;
//   private _name: string;
//   private _value: string;

//   constructor(name: string, value: any) {
//     this._type = "interface";
//     this._name = name;
//     this._value = value;
//   }

//   add(name: string, value: string) {
//     return new XodInterface(name, value);
//   }
// }
import prettier from "prettier";

function init() {
  function _literal(input: string) {
    return {
      type: "literal",
      value: input,
    };
  }

  function _string() {
    return {
      type: "string",
    };
  }

  function _number() {
    return {
      type: "number",
    };
  }

  function _union(input: any[]) {
    return {
      type: "union",
      value: input,
    };
  }

  function _array(input: any[]) {
    return {
      type: "array",
      value: input,
    };
  }

  function _object(input: any) {
    return {
      type: "object",
      value: input,
    };
  }

  function _type(name: string, value: any) {
    return {
      type: "type",
      name,
      value,
    };
  }

  function _interface(name: string, value: any) {
    return {
      type: "interface",
      name,
      value,
    };
  }

  function generateValue(input: any) {
    const { type, value, name } = input;
    switch (type) {
      case "literal": {
        return `"${value}"`;
      }
      case "string": {
        return `string`;
      }
      case "number": {
        return `number`;
      }
      case "union": {
        return `(${value.map((x) => generateValue(x)).join(" | ")})`;
      }
      case "array": {
        return `[${value.map((x) => generateValue(x)).join(", ")}]`;
      }
      case "object": {
        return `{${Object.keys(value)
          .map((key) => `${key}: ${generateValue(value[key])};`)
          .join(" ")}}`;
      }
      case "type": {
        return `${name}`;
      }
      case "interface": {
        return `${name}`;
      }
      default: {
        throw new Error(`Unknown type: ${type}`);
      }
    }
  }

  function generate(input: any) {
    let out = "";
    const { type, value, name } = input;
    switch (type) {
      case "type": {
        out += `type ${name} = ${generateValue(value)};`;
        break;
      }
      case "interface": {
        out += `interface ${name} ${generateValue(value)};`;
        break;
      }
      default: {
        throw new Error(`Invalid type: ${type}`);
      }
    }
    return out;
  }

  function generateMany(input: any[]) {
    return input.map((x) => generate(x)).join("\n");
  }

  function writeFile(fileName: string, input: any[]) {
    const code = generate(input);
    console.log(code);
  }

  return {
    literal: _literal,
    string: _string,
    number: _number,
    union: _union,
    array: _array,
    object: _object,
    type: _type,
    interface: _interface,
    generate,
    generateMany,
    writeFile,
  };
}

export const x = init();

const role = x.type("Role", x.union([x.literal("admin"), x.literal("user")]));
const user = x.interface("User", x.object({ name: x.string(), role }));
const user2 = x.type(
  "UserButAType",
  x.object({
    name: x.string(),
    role,
    id: x.number(),
    age: x.number(),
    nick: x.string(),
  })
);

const out = prettier.format(x.generateMany([role, user, user2]), {
  parser: "typescript",
});
console.log(out);
