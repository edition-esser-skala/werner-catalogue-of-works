\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Tempo giusto"
    r8 c'\f e, f g16( c) e( g) f8 e16 d
    e( g) g( a) a( h) h( c) c8 a16( h) h( c) c( d) \gotoBar "6"
    e,16 c8 e16 d8 h c4 r
    r16 g\p c( e) d d c( h) c8 e, r e'
    d c16 h a8 g fis4 r
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Tempo giusto"
    r8 e\f c d e16( g) c( e) d8 c16 h
    c( e) e( fis) fis( g) g( a) a8 fis16( g) g( a) a( h) \gotoBar "6"
    c,16 e,8 a16 f8 d e4 r
    r8 a\p f16 f e( d) e8 c r4
    r8 g' e16( d) e8 a,4 r
  }
}

Soli = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Tempo giusto"
    R1*2 \gotoBar "6"
    r2 r8 c' e, f
    g e f g c, e g[ c16 e]
    d8 c16[ h] a8 g fis a h c
  }
}

SoliLyrics = \lyricmode {
  So habt dan
  acht und nicht ver -- acht mein groſ --
  _ ſe Lieb und Gnad, wer die "ver -"
}

BassoContinuo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Tempo giusto"
    c'8 c, r f, c'8. c16 f8 g
    c, c'4 h8 a d4 c8 \gotoBar "6"
    c, a f g c4. d8\p
    e4 f8 g c, c' e, c
    h4 c d4. c8
  }
}

BassFigures = \figuremode {
  r1
  r8 <5 3> <6 4\+> <8 6>4 <5 _+>8 <6 4> <8 6>
  r4 <8 6>2.
  <6>4 q2.
  r4 <6>8 <5> <_+>4 <6 4>
}

\score {
  <<
    \new StaffGroup <<
      \new GrandStaff <<
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
