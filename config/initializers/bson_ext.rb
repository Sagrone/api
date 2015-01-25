#
# Extend BSON::ObjectId:
#   - to show 'id: "abc123"'
#   - instead of '_id:{ $oid: "abc123"}'
#
# Solution from: http://stackoverflow.com/a/20813109
#
module BSON
  class ObjectId
    def to_json(*args)
      to_s.to_json
    end

    def as_json(*args)
      to_s.as_json
    end
  end
end
