\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \twotwotime \key f \major \time 4/2 \tempoMarkup "[no tempo]"
      \set Staff.timeSignatureFraction = 2/2
    R\breve*2
    r1 r4 c'\f c c
    d2 g, f'1 \gotoBar "9"
    f1 r
    R\breve
    r4 b,\p b b f'2 f,~
    f e r1
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \twotwotime \key f \major \time 4/2 \tempoMarkup "[no tempo]"
      \set Staff.timeSignatureFraction = 2/2
    r4 f\f f f g2 c,
    b'1~ b4 a8 g a4 f
    d'1 c~
    c2 h a4 d a \hA h \gotoBar "9"
    f'1 r
    R\breve
    r1 r4 f,\p f f
    b2 b,1 a2
  }
}

Basso = {
  \relative c {
    \clef bass
    \twotwotime \key f \major \time 4/2 \autoBeamOff \tempoMarkup "[no tempo]"
      \set Staff.timeSignatureFraction = 2/2
    R\breve*4 \gotoBar "9"
    f1^\solo g2 c,~
    c b' a f
    d'1 c
    r2 e, f a4 a
  }
}

BassoLyrics = \lyricmode {
  Al -- ma Re --
  dem -- pto -- ris
  Ma -- ter,
  quae per -- vi -- a
}

Organo = {
  \relative c {
    \clef bass
    \twotwotime \key f \major \time 4/2 \tempoMarkup "[no tempo]"
      \set Staff.timeSignatureFraction = 2/2
    f,2-\solo f'1 e2
    d4 g g g c,2 f
    b, b'1 a2
    g1 d \gotoBar "9"
    f,2 f'1 e4 d
    e c d e f2 a %10
    b, b'1 a2
    g1 f~
  }
}

BassFigures = \figuremode {
  r1 <2>2 <6>
  q1 <7>
  r <2>
  <4>2 <_!> <3 #(dotbf 5)>2. <_ 6!>4
  r1 <2>2 <6>
  q q1.
  r1 <5 2>2 <6>
  <7> <6> <4> <3>
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
        \set Staff.instrumentName = "B"
        \new Voice = "Basso" { \dynamicUp \Basso }
      }
      \new Lyrics \lyricsto Basso \BassoLyrics
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
