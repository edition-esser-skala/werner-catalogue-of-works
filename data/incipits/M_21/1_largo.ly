\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \dorian \time 3/4 \tempoMarkup "Largo"
    d'4 f cis
    d \grace { c16[ b] } a4 b
    cis, d8( e) f( gis)
    a4 h! cis8.(\trill h32 cis)
    d4 e \grace { d16[ c] } h4
    c e a,8( d)
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \dorian \time 3/4 \tempoMarkup "Largo"
    R2.*4
    a'4 c! gis
    a \grace { g16[ f] } e4 f
  }
}

BassoContinuo = {
  \relative c {
    \clef bass
    \key d \dorian \time 3/4 \tempoMarkup "Largo"
    d2 e4
    f fis g
    a b2
    a4 g! e
    f e e,
    a cis d
  }
}

BassFigures = \figuremode {
  r2 <6\\>4
  <6>2.
  <_+>4 <7> <6\\>
  <_+> <6 _!> <6\\>
  <6> <6 4!> <5 _+>
  <_!> r2
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
        \set Staff.instrumentName = "bc"
        \BassoContinuo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
}
