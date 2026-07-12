\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \twofourtime \key f \major \time 2/4 \tempoMarkup "Allegro"
    r8 f'4\f a16 b
    c8 c,4 d16 e
    f8. g16 a4 \gotoBar "18"
    a,8 f r4
    r8 c'4\p d16 e
    f( e) f8 r4
    R2*2
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \twofourtime \key f \major \time 2/4 \tempoMarkup "Allegro"
    a'8.\f b16 c b c8
    g a16 b c b c8
    f, c' f4 \gotoBar "18"
    f,4 r
    R2
    r8 f4\p a16 b
    c( b) c8 r4
    R2
  }
}

Soli = {
  \relative c' {
    \clef tenor
    \twofourtime \key f \major \time 2/4 \autoBeamOff \tempoMarkup "Allegro"
    R2*3 \gotoBar "18"
    f,4. a16[ b]
    c8 c,4 d16[ e]
    f4 f'~
    f8 e16[ d] c8 d
    b4.\trill b8
  }
}

SoliLyrics = \lyricmode {
  Ob -- ſchon
  Gott auß der
  Noth al --
  len Men -- ſchen
  helf -- fen
}

BassoContinuo = {
  \relative c {
    \clef bass
    \twofourtime \key f \major \time 2/4 \tempoMarkup "Allegro"
    f8. g16 a8 f
    e4 a
    d,8 c16 b a8 b \gotoBar "18"
    f'8.\p g16 a8 f
    e4 c
    d4. c16 b
    a4. f'8
    g f16 e d8 e
  }
}

BassFigures = \figuremode {
  r2
  <6>
  r4 <6>
  r2
  <6>
  r
  <6>4. q8
  r4 q
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
        \set Staff.instrumentName = "Gerecht."
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
