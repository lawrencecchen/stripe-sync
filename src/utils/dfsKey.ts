// @ts-nocheck <typescript is too hard for me :(>
export function dfsKey(obj: object, key: unknown) {
  if (obj[key]) {
    return obj[key];
  }
  for (const k in obj) {
    if (obj.hasOwnProperty(k)) {
      const v = obj[k];
      if (typeof v === "object") {
        const result = dfsKey(v, key);
        if (result) {
          return result;
        }
      }
    }
  }
  return null;
}

export function dfsKeyAll(obj: object, key: unknown) {
  const results = [];
  if (obj[key]) {
    results.push(obj[key]);
  }
  for (const k in obj) {
    if (obj.hasOwnProperty(k)) {
      const v = obj[k];
      if (typeof v === "object") {
        const result = dfsKeyAll(v, key);
        if (result.length > 0) {
          results.push(...result);
        }
      }
    }
  }
  return results;
}
