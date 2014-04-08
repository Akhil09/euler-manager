require 'yaml'

module Euler

  # This class represents a project Euler problem.

  class Problem

    # Returns the problem with the given id.
    def self.find id
      problem_spec_file = "#{Euler.problems_dir}/#{id}.yml"
      problem_spec      = YAML.load_file(problem_spec_file)
      Problem.new problem_spec
    end

    attr_reader :id, :name, :content

    # Given a hash with symbol keys initialize the problem using the +:id+,
    # +:name+, and +:content+ keys.
    def initialize options
      @id      = options[:id]
      @name    = options[:name]
      @content = options[:content]
    end

    # Returns true if this problem has an answer.
    def has_answer?
      not answer.empty?
    end

    # Returns this problem's answer.
    def answer
      @@answers ||= YAML.load_file(Euler.answers_file)
      @@answers[id].to_s
    end

    # Converts the problem to a hash.
    def to_hash
      {
        id:       id,
        name:     name,
        content:  content
      }
    end

    # Converts the problem to YAML.
    def to_yaml
      to_hash.to_yaml
    end

  end

end

