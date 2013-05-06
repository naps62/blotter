#!/usr/bin/env ruby

require 'blotter'

Blot::bin :echo

Blot::params do
  threads 1, 2, 4
  name %w(miguel palhas)
  spp [:coisa, :outra]
end


Blot::kbest do
  min_execs 3
  max_execs 10
  diff 0.05
  minimize :walltime
end

Blot::run
