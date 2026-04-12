\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \dorian \time 4/4 \tempoMarkup "Molto largo"
    r8^\conSord g' g([ as)] as4 r
    r8 as16( f) g( es) f( d) es4 r \gotoBar "6"
    r16 c'32( b as g f16) es8 d16.\trill c32 c4 r
    r2 r8 d' \sbOn \tuplet 3/2 8 { d16( es f) } es( d) \sbOff
    \tuplet 3/2 8 { es16( d c) } c8 es4 \appoggiatura f16 es( d) \appoggiatura es d( c) \appoggiatura d c( b) \appoggiatura c b( as)
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \dorian \time 4/4 \tempoMarkup "Molto largo"
    r8^\conSord es es e16( f) f4 r
    r8 f16( d) es( c) d( h) c4 r \gotoBar "6"
    r8 c4 h8 c4 r
    r2 r8 f \tuplet 3/2 8 { f16( g as) } g8
    \tuplet 3/2 8 { g16( f es) } es8 es'4 \appoggiatura f16 es( d) \appoggiatura es d( c) \appoggiatura d c( b) \appoggiatura c b( as)
  }
}

Viola = {
  \relative c' {
    \clef alto
    \key c \dorian \time 4/4 \tempoMarkup "Molto largo"
    c'1
    h4 r r8 c \sbOn \tuplet 3/2 8 { es16 d c } c des \sbOff \gotoBar "6"
    c,4 r r2
    R1*2
  }
}

Soli = {
  \relative c' {
    \clef soprano
    \key c \dorian \time 4/4 \autoBeamOff \tempoMarkup "Molto largo"
    R1*2 \gotoBar "6"
    r2 r8 g' c4
    r8 g h d16 es f[ g as8]~ as g16[ f]
    \tuplet 3/2 8 { es[ d c] } c8 r es \appoggiatura f16 es[ d] \appoggiatura es d[ c] \appoggiatura d c[ b] \appoggiatura c b[ as]
  }
}

SoliLyrics = \lyricmode {
  Ô Gott!
  der durch un -- er -- glich -- ne
  Stär -- ke daß fün -- ſtre Nichts von
}

Continuo = {
  \relative c {
    \clef bass
    \key c \dorian \time 4/4 \tempoMarkup "Molto largo"
    c4 r r8 c c c
    c4 r c r \gotoBar "6"
    as8 f' g g, c4 r16 g' es16. c32
    h4 r r8 \hA h h h
    c c g' as b!4 d,
  }
}

BassFigures = \figuremode {
  r1
  <7! 4 2>2 <_->
  r8 <_-> <6- 4> <5 _!> r4 r16 <\t>8.
  r2 r8 <7- 5>4.
  r4 <6>2 <6>4
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
          \set Staff.instrumentName = \markup \center-column { "vla" "amabile" }
          \Viola
        }
    >>
    \new ChoirStaff <<
      \new Staff {
        \set Staff.instrumentName = "Jahel"
        \new Voice = "Soli" { \dynamicUp \Soli }
      }
      \new Lyrics \lyricsto Soli \SoliLyrics
    >>
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = "bc"
        \Continuo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16) }
}
