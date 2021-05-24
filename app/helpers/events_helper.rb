module EventsHelper
    def is_validated?(id)
        Event.find(id).validated
    end
end
