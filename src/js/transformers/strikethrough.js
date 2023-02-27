function strikeThrough(text) {
  return text
    .split('')
    .map(char => char + '\u0335')
    .join('')
}

async (clipboardContentString) => {
   return strikeThrough(clipboardContentString)
}