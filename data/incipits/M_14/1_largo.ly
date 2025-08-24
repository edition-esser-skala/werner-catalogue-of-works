\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \minor \time 4/4 \tempoMarkup "Largo"
    R1
    r2 a'4 f'~
    f8( e) g( b)~ b a16 g f( g) e8
    fis g a g16 \hA fis g8 f16 e f8 e16 d
    e8 f16 g f4. g16 a g4~
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \minor \time 4/4 \tempoMarkup "Largo"
    a'4 f'~ f8( e) g( b)
    cis,4 d8 e f g a4~
    a8 g16 f e( f) d8 cis16( d) e8 d16( e) \hA cis8
    d c16 b c8 b16 a h8 c d c16 \hA h
    c4. c8 d4. b8~
  }
}

Viola = {
  \relative c' {
    \clef alto
    \key d \minor \time 4/4 \tempoMarkup "Largo"
    R1*4
    c4 a'~ a8( g) b( d)
  }
}

Organo = {
  \relative c {
    \clef bass
    \key d \minor \time 4/4 \tempoMarkup "Largo"
    d8 d d d g4 r8 g~
    g a16 g f8 e d4. c!8
    b2 a4 r8 a'
    d,4 r8 d g4 g,
    c f8 a b,2
  }
}

BassFigures = \figuremode {
  r2 <7>8 <6>4 <5>8
  <4\+ 2>4 <6>8 <6\\> r2
  <7>8 <6>4. <9 _+>8 <8 \t>4 <_+>8
  q4. q8 <_!> <6 4> <7 _!>4
  r2 <7>8 <6>4 <5>8
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
        \set Staff.instrumentName = \markup \center-column { "org" "b" }
        \Organo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
}
