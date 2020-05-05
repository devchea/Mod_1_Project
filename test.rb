def question4   #actor question
    r = randomID
    find_char = Character.find_by(id: r)

    r1 = randomID
    r1_act = Character.find_by(id: r1).actor.actor
    r2 = randomID
    r2_act = Character.find_by(id: r2).actor.actor
    r3 = randomID
    r3_act = Character.find_by(id: r3).actor.actor

    choices = [r1_act, r2_act, r3_act, find_char.actor.actor].shuffle

    prompt = TTY::Prompt.new
    input = prompt.select("What actor/actress plays #{find_char.name}?", choices)
    # binding.pry
    if input == find_char.actor.actor
        correct
    else
        puts wrong
    end
end
question4

