window.BoardApp = ''

router = new RouterRouter
router.route 'dashboard', () ->
  window.BoardApp = 'dashboard'
  return
