\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key g \minor \time 3/4 \tempoMarkup "Larghetto"
    d'2.~
    d2 es4~
    \tuplet 3/2 4 { es8 d c d c b c b a }
    b4 g r
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key g \minor \time 3/4 \tempoMarkup "Larghetto"
    b'2.~
    b2 g8 c~
    \tuplet 3/2 4 { c b a b a g a g fis }
    g2.
  }
}

Viola = {
  \relative c' {
    \clef alto
    \key g \minor \time 3/4 \tempoMarkup "Larghetto"
    g'2.~
    g2 es4
    r r r8 d
    d4. b8 g b
  }
}

Continuo = {
  \relative c {
    \clef bass
    \key g \minor \time 3/4 \tempoMarkup "Larghetto"
    r8 g b d g b
    g d b g c4
    r r r8 d
    g d b g b' g
  }
}

BassFigures = \figuremode {
  r2.
  r2 <_->4
  r2.
  r
}

\score {
  <<
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
      \new Staff {
        \set Staff.instrumentName = "vla"
        \Viola
      }
      \new Staff {
        \set Staff.instrumentName = "bc"
        \Continuo
      }
      \new FiguredBass { \BassFigures }
    >>
  >>
}
