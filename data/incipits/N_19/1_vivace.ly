\version "2.24.2"
\include "header.ly"

OboeI = {
  \relative c' {
    \clef treble
    \key b \major \time 3/2 \tempoMarkup "Vivace"
      \override TupletBracket.tuplet-slur = ##t
      \override TupletBracket.bracket-visibility = #'if-no-beam
      \tupletDown
    R1.
    \tuplet 3/2 2 { d'4 f b f d b d c f, }
    b2 r r
    \tuplet 3/2 2 { f'4 d b' f d f es c a }
    d1.~
    d~\trill
    d2 r r
  }
}

OboeII = {
  \relative c' {
    \clef treble
    \key b \major \time 3/2 \tempoMarkup "Vivace"
      \override TupletBracket.tuplet-slur = ##t
      \override TupletBracket.bracket-visibility = #'if-no-beam
      \tupletDown
    R1.
    \tuplet 3/2 2 { b'2 d4 d b d b a c }
    d2 r r
    \tuplet 3/2 2 { d4 b f' d b d c a f }
    b1.~
    b~\trill
    b2 r r
  }
}

ViolinoI = {
  \relative c' {
    \clef treble
    \key b \major \time 3/2 \tempoMarkup "Vivace"
      \override TupletBracket.tuplet-slur = ##t
      \override TupletBracket.bracket-visibility = #'if-no-beam
      \tupletDown
    \tuplet 3/2 2 { d'4 f b f d b d c f, }
    b2 r r
    \tuplet 3/2 2 { f'4 d b' f d f es c a }
    d2 r r
    \tuplet 3/2 2 { b4 d8 b d4 b d8 b f'4 b, d8 b b'4
    b, d8 b d4 b d8 b f'4 b, d8 b b'4
    b, d8 b d4 b f b d b d }
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key b \major \time 3/2 \tempoMarkup "Vivace"
      \override TupletBracket.tuplet-slur = ##t
      \override TupletBracket.bracket-visibility = #'if-no-beam
      \tupletDown
    \tuplet 3/2 2 { b'2 d4 d b d b a c }
    d2 r r
    \tuplet 3/2 2 { d4 b f' d b d c a f }
    b2 r r
    \tuplet 3/2 2 { d,4 f8 d f4 d f8 d b'4 d, f8 d d'4
    d, f8 d f4 d f8 d b'4 d, f8 d d'4
    d, f8 d f4 d b f' b f b }
  }
}

Organo = {
  \relative c {
    \clef bass
    \key b \major \time 3/2 \tempoMarkup "Vivace"
    b1 f'2
    b,1 f2
    b1 f'2
    b,1 f2
    b1.~
    b~
    b
  }
}

BassFigures = \figuremode {
  r1 <6 4>4 <5 3>
  r1 <6 4>4 <5 3>
  r1 <7>2
  r1 <7>2
  r1.
  r
  r
}

\score {
  <<
    \new StaffGroup <<
      \new GrandStaff \with { \smallGroupDistance } <<
        \set GrandStaff.instrumentName = "ob"
        \new Staff {
          \set Staff.instrumentName = "1"
          \OboeI
        }
        \new Staff {
          \set Staff.instrumentName = "2"
          \OboeII
        }
      >>
    >>
    \new StaffGroup <<
      \new GrandStaff \with { \smallGroupDistance } <<
        \set GrandStaff.instrumentName = "vl"
        \new Staff {
          \set Staff.instrumentName = "1"
          \ViolinoI
        }
        \new Staff {
          \set Staff.instrumentName = "2"
          \ViolinoII
        }
      >>
    >>
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = \markup \center-column { "org" "b" }
        \Organo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
}
