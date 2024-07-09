const comparePaths = (a, b) => {
    const a_parts = a.split('\\');
    const b_parts = b.split('\\');
    const arr = [...a_parts, ...b_parts];
    const diffs = arr.filter(item => arr.indexOf(item) === arr.lastIndexOf(item));
    let path_parts = diffs.filter(part => b_parts.includes(part));
    const res = ".".repeat(path_parts.length && path_parts.length-1 || 0) +'\\'+ path_parts.join('\\');
    return res;
};