FactoryGirl.define do
  factory(:vocab_worksheet) do
    body "A sentence about dogs"
    title "Dogs"
    user_id nil
  end
end
