async (clipboardContentString) => {
  clipboardContentString= clipboardContentString.replace(/[a-z]/g, (char) => {
    const code = char.charCodeAt() - 97;
    return String.fromCharCode(55349, code + 56658);
  });
  return clipboardContentString;
}