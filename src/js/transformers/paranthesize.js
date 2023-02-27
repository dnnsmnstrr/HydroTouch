async (clipboardContent) => {
  if (!clipboardContent) return ""
  return '(' + clipboardContent + ')'
}