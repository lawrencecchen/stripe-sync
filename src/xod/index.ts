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
    switch (input.type) {
      case "literal": {
        return `"${input.value}"`;
      }
      case "string": {
        return `string`;
      }
      case "number": {
        return `number`;
      }
      case "union": {
        return `(${input.value.map((x) => generateValue(x)).join(" | ")})`;
      }
      case "array": {
        return `[${input.value.map((x) => generateValue(x)).join(", ")}]`;
      }
      case "object": {
        return `{${Object.keys(input.value)
          .map((key) => `${key}: ${generateValue(input.value[key])};`)
          .join(" ")}}`;
      }
      case "type": {
        return `${input.name}`;
      }
      case "interface": {
        return `${input.name}`;
      }
      default: {
        throw new Error(`Unknown type: ${input.type}`);
      }
    }
  }

  function generate(input: any) {
    let out = "";
    // console.log(input);
    switch (input.type) {
      case "type": {
        out += `type ${input.name} = ${generateValue(input.value)};`;
        break;
      }
      case "interface": {
        out += `interface ${input.name} ${generateValue(input.value)};`;
        break;
      }
      default: {
        throw new Error(`Invalid type: ${input.type}`);
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

const out = x.generateMany([role, user]);
console.log(out);
