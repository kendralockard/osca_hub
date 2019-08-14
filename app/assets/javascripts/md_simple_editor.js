(function() {
  var initializeEditor, insertAtCaret, md_simple_editor, preview;

  md_simple_editor = function() {
    return $('.btn-toolbar button').click(function() {
      var att_class, option, rgex, text, textarea;
      att_class = this.classList;
      rgex = /md_/;
      option = $.grep(att_class, function(item) {
        return rgex.test(item);
      });
      if (option.length !== 0) {
        option = option[0].toString();
        text = option === 'md_h1' ? "# " : option === 'md_h2' ? "## " : option === 'md_h3' ? "### " : option === 'md_h4' ? "#### " : option === 'md_h5' ? "##### " : option === 'md_italic' ? "*...*" : option === 'md_bold' ? "__...__" : option === 'md_list-ul' ? "* \n* \n* " : option === 'md_indent' ? "> " : option === 'md_underline' ? "<u>...</u>" : option === 'md_camera-retro' ? "![image description](https://www.your-photo-link-here.com)\n" : void 0;
        textarea = $('#md-editor #md-text textarea');
        return insertAtCaret(textarea.attr('id'), text);
      }
    });
  };

  preview = function() {
    if ($('#md-text').prop('hidden')) {
      $('.preview_md').text('Preview');
      $('#md-text').removeAttr('hidden');
      $('.preview-panel').attr('hidden', 'true');
      return false;
    } else {
      return $.post('/md_simple_editor/preview', {
        md: $('#md-text textarea').val()
      }, function(data) {
        $('.preview_md').text('Editor');
        $('#md-text').attr('hidden', 'true');
        $('.preview-panel').removeAttr('hidden');
        return $('#md-preview').html(data);
      });
    }
  };

  insertAtCaret = function(areaId, text) {
    var back, br, front, range, scrollPos, strPos, txtarea;
    txtarea = document.getElementById(areaId);
    scrollPos = txtarea.scrollTop;
    strPos = 0;
    br = (txtarea.selectionStart || txtarea.selectionStart === "0" ? "ff" : (document.selection ? "ie" : false));
    if (br === "ie") {
      txtarea.focus();
      range = document.selection.createRange();
      range.moveStart("character", -txtarea.value.length);
      strPos = range.text.length;
    } else {
      if (br === "ff") {
        strPos = txtarea.selectionStart;
      }
    }
    front = txtarea.value.substring(0, strPos);
    back = txtarea.value.substring(strPos, txtarea.value.length);
    txtarea.value = front + text + back;
    strPos = strPos + text.length;
    if (br === "ie") {
      txtarea.focus();
      range = document.selection.createRange();
      range.moveStart("character", -txtarea.value.length);
      range.moveStart("character", strPos);
      range.moveEnd("character", 0);
      range.select();
    } else if (br === "ff") {
      txtarea.selectionStart = strPos;
      txtarea.selectionEnd = strPos;
      txtarea.focus();
    }
    return txtarea.scrollTop = scrollPos;
  };

  initializeEditor = function() {
    $('.md_list-ol').hide();
    $('.md_table').hide();
    $('.md_square').hide();
    $('.md_minus').hide();
    $('.md_link').hide();
    $('.md_camera-retro').hide();
    md_simple_editor();
    $(document).off('page:load ready', initializeEditor);
    return $('.preview_md').click(function() {
      return preview();
    });
  };

  $(document).on('turbolinks:load', initializeEditor);

}).call(this);

function show_markdown_toolbar() {
  $('.btn-toolbar').show();
  $('#markdown-toolbar').hide();
  $("#markdown-toolbar-hide").show();
}

function hide_markdown_toolbar() {
  $('.btn-toolbar').hide();
  $('#markdown-toolbar-hide').hide();
  $("#markdown-toolbar").show();
}
