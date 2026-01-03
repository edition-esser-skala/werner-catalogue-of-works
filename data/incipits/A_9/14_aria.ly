\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key b \major \time 6/8 \tempoMarkup "Tempo giusto"
    b'8.\f c16 d es f4 b8
    a c16 b a g f8 b es,
    d f16 es d c b8 f' g \gotoBar "10"
    R2.
    f,16 e f g a b a g a b c d
    c8 a r r4 r8
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key b \major \time 6/8 \tempoMarkup "Tempo giusto"
    b'8.\f c16 d es f4 b8
    a c16 b a g f8 b es,
    d f16 es d c b8 f' g \gotoBar "10"
    R2.
    r4 r8 f,16 e f g a b
    a8 f r r4 r8
  }
}

Soli = {
  \relative c' {
    \clef tenor
    \key b \major \time 6/8 \autoBeamOff \tempoMarkup "Tempo giusto"
    R2.*3 \gotoBar "10"
    f,8 b b b[ a] g
    f4 r8 r4 r8
    f es' es es[ d] c
  }
}

SoliLyrics = \lyricmode {
  Waß ach -- te ich der
  Peyn,
  ich pfle -- ge nur zu
}

Continuo = {
  \relative c {
    \clef bass
    \key b \major \time 6/8 \tempoMarkup "Tempo giusto"
    b8 b' b b a g
    f4 es8 d4 c8
    b4 c8 d4 es8 \gotoBar "10"
    b8 b' b b a g
    f4 r8 f4 r8
    f es' es es d c
  }
}

BassFigures = \figuremode {
  r2.
  r
  r
  r
  r
  r8 <4 2>4 <\t \t> <6>8
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
        \set Staff.instrumentName = "Lucifer"
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
}
