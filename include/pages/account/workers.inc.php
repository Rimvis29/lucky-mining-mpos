<?php
$defflip = (!cfip()) ? exit(header('HTTP/1.1 401 Unauthorized')) : 1;

if ($user->isAuthenticated()) {


  if (!$coin_address->getCoinAddress($_SESSION['USERDATA']['id']) AND $setting->getValue('disable_worker_edit')) {
    $_SESSION['POPUP'][] = array('CONTENT' => 'У вас нет адреса выплат.', 'TYPE' => 'alert alert-danger');
    $_SESSION['POPUP'][] = array('CONTENT' => 'Вы не можете добавлять воркеров, если в пользовательских настройках не установлен действительный адрес выплат.', 'TYPE' => 'alert alert-danger');
    $smarty->assign('CONTENT', 'disabled.tpl');
  } else {
    switch (@$_REQUEST['do']) {
    case 'delete':
      if (!$config['csrf']['enabled'] || $config['csrf']['enabled'] && $csrftoken->valid) {
        if ($worker->deleteWorker($_SESSION['USERDATA']['id'], $_GET['id'])) {
          $_SESSION['POPUP'][] = array('CONTENT' => 'Воркер удален', 'TYPE' => 'alert alert-success');
        } else {
          $_SESSION['POPUP'][] = array('CONTENT' => $worker->getError(), 'TYPE' => 'alert alert-danger');
        }
      } else {
        $_SESSION['POPUP'][] = array('CONTENT' => $csrftoken->getErrorWithDescriptionHTML(), 'TYPE' => 'alert alert-warning');
      }
      break;

    case 'add':
      if (!$config['csrf']['enabled'] || $config['csrf']['enabled'] && $csrftoken->valid) {
        if ($worker->addWorker($_SESSION['USERDATA']['id'], $_POST['username'], $_POST['password'])) {
          $_SESSION['POPUP'][] = array('CONTENT' => 'Воркер добавлен', 'TYPE' => 'alert alert-success');
        } else {
          $_SESSION['POPUP'][] = array('CONTENT' => $worker->getError(), 'TYPE' => 'alert alert-danger');
        }
      } else {
        $_SESSION['POPUP'][] = array('CONTENT' => $csrftoken->getErrorWithDescriptionHTML(), 'TYPE' => 'alert alert-warning');
      }
      break;

    case 'update':
      if (!$config['csrf']['enabled'] || $config['csrf']['enabled'] && $csrftoken->valid) {
        if ($worker->updateWorkers($_SESSION['USERDATA']['id'], @$_POST['data'])) {
          $_SESSION['POPUP'][] = array('CONTENT' => 'Воркер обновлен', 'TYPE' => 'alert alert-success');
        } else {
          $_SESSION['POPUP'][] = array('CONTENT' => $worker->getError(), 'TYPE' => 'alert alert-danger');
        }
      } else {
        $_SESSION['POPUP'][] = array('CONTENT' => $csrftoken->getErrorWithDescriptionHTML(), 'TYPE' => 'alert alert-warning');
      }
      break;
    }

    $smarty->assign('DISABLE_IDLEWORKERNOTIFICATIONS', $setting->getValue('notifications_disable_idle_worker'));
    $aWorkers = $worker->getWorkers($_SESSION['USERDATA']['id']);
    if (!$aWorkers) $_SESSION['POPUP'][] = array('CONTENT' => 'У вас нет настроенных воркеров', 'TYPE' => 'alert alert-danger');

    $smarty->assign('WORKERS', $aWorkers);
    $smarty->assign('CONTENT', 'default.tpl');
  }
}
