<?php

function removeSpecialChars($suaString) {
  $string = preg_replace( '/[`^~\'"]/', null, iconv( 'UTF-8', 'ASCII//TRANSLIT', $suaString ) );
  $string = htmlspecialchars($string);
  return $string;
}
