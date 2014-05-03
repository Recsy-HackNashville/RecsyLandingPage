<?php


/***   Script from:   http://coursesweb.net/ajax/   ***/

$updir = 'upload';		// Directory for uploads
$max_size = 2500;			// Sets maxim size allowed for the uploaded files, in kilobytes

// sets an array with the file types allowed
$allowtype = array('bmp', 'gif', 'htm', 'html', 'jpg', 'jpeg', 'mp3', 'pdf', 'png', 'rar', 'zip', 'doc', 'docx', 'ppt', 'pptx', 'xls', 'xlsx');

// if the folder for upload (defined in $updir) doesn't exist, tries to create it (with CHMOD 0777)
if (!is_dir($updir)) mkdir($updir, 0777);

/** Loading the files on server **/

$result = array();          // Array to store the results and errors

// if receive a valid file from server
if (isset ($_FILES['file_up'])) {
  // checks the files received for upload
  for($f=0; $f<count($_FILES['file_up']['name']); $f++) {
    $fup = $_FILES['file_up']['name'][$f];       // gets the name of the file

    // checks to not be an empty field (the name of the file to have more then 1 character)
    if(strlen($fup)>1) {
      // checks if the file has the extension type allowed
      $type = end(explode('.', strtolower($fup)));
      if (in_array($type, $allowtype)) {
        // checks if the file has the size allowed
        if ($_FILES['file_up']['size'][$f]<=$max_size*1000) {
          // If there are no errors in the copying process
          if ($_FILES['file_up']['error'][$f]==0) {
            // Sets the path and the name for the file to be uploaded
            $thefile = $updir . '/' . $fup;
            // If the file cannot be uploaded, it returns error message
            if (!move_uploaded_file ($_FILES['file_up']['tmp_name'][$f], $thefile)) {
              $result[$f] = ' The file could not be copied, try again';
            }
            else {
              // store the name of the uploaded file
              $result[$f] = '<b>'.$fup.'</b> - OK';
            }
          }
        }
        else { $result[$f] = 'The file <b>'. $fup. '</b> exceeds the maximum allowed size of <i>'. $max_size. 'KB</i>'; }
      }
      else { $result[$f] = 'File type extension <b>.'. $type. '</b> is not allowed'; }
    }
  }

   // Return the result
  $result2 = implode('<br /> ', $result);
  echo '<h4>Files uploaded:</h4> '.$result2;
}
?>