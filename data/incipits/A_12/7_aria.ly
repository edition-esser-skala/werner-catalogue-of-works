\version "2.24.2"
\include "header.ly"

Oboe = {
  \relative c' {
    \clef treble
    \key c \dorian \time 4/4 \tempoMarkup "Largo"
    c'4.-\markup \remark "cantabile" es8 d( fis) g4
    c,8( e) f2 es4 \gotoBar "6"
    R1*3
    c4. d16 e f8 g as?4
  }
}

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \dorian \time 4/4 \tempoMarkup "Largo"
    r8 g'-\conSord g g g r g( g')
    c,16( h) c8 f,( c') h c16 \hA h c4 \gotoBar "6"
    r2 g8( h) d( g)~
    g f es16 d c8~ c h h4
    r2 g'8( e) c( des)
    as4( g8.)\trill f16 f4 r8 c'
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \dorian \time 4/4 \tempoMarkup "Largo"
    r8 es-\conSord es c d4 r8 e
    f4 r8 as d, g es c' \gotoBar "6"
    r2 g8( h) d( g,)
    c c,4 c8 d2
    r2 g'8( e) c( f,)
    f4( e8.)\trill f16 f4 r8 c
  }
}

Soli = {
  \relative c {
    \clef bass
    \key c \dorian \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    R1*2 \gotoBar "6"
    c'8[ g] es[ c] h[ d] g4
    c16[ b as8] g[ fis] fis[ g] g,4
    d''8[ h] g[ f] e[ f16 \hA e] f8 b
    c4 c, f, r
  }
}

SoliLyrics = \lyricmode {
  Mei -- ne Ur -- theill
  ſein ver -- bor -- gen,
  die ich nie -- _ mand
  kün -- dig mach,
}

BassoContinuo = {
  \relative c {
    \clef bass
    \key c \dorian \time 4/4 \tempoMarkup "Largo"
    c8 c' c c h4 r8 b
    a4 r8 as g g as as \gotoBar "6"
    c,4 c' h b
    as a g g,8 a
    h4 h' b as8 b
    c4. b8 as g f es!
  }
}

BassFigures = \figuremode {
  r2 <6>4. <4! 2>8
  <6>2 <7 _!>4 <5>
  r <6>
  <7>8 <6> <6\\>4 <4>8 <_!>4.
  <6>4 q8 <5> <4! 2>4 <6>8 <_->
  <6- 4>4 <5 _!> <6> <_->
}

\score {
  <<
    \new Staff {
      \set Staff.instrumentName = "ob"
      \Oboe
    }
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
    \new ChoirStaff <<
      \new Staff {
        \set Staff.instrumentName = "Schöpffer"
        \new Voice = "Soli" { \dynamicUp \Soli }
      }
      \new Lyrics \lyricsto Soli \SoliLyrics
    >>
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = "bc"
        \BassoContinuo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
}
