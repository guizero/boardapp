window.BoardApp = {layout:"dashboard"}

router = new RouterRouter
router.route 'dashboard', () ->
  window.BoardApp = 'dashboard'
  return
