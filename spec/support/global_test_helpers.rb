def expect_to_see_notice(message)
  expect(find('.alert-success')).to have_text(message)
end