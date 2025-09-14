\version "2.24.2"
\include "header.ly"

Soprano = {
  \relative c' {
    \clef soprano
    \key d \minor \time 8/4 \tempoMarkup "[no tempo]" \autoBeamOff
      \once \omit Staff.TimeSignature
    R1*2 \bar "||"
    \time 2/2 a'2 a4 a
    b2 g4 g
    f2 e
    d f
    g a4 a
    a2 g
    f a
    g f
    e r
  }
}

SopranoLyrics = \lyricmode {
  e -- gre -- di --
  en -- tem de
  tem -- _
  plo a
  la -- te -- re
  dex -- _
  tro, al --
  le -- lu --
  ia.
}

Alto = {
  \relative c' {
    \clef alto
    \key d \minor \time 8/4 \tempoMarkup "[no tempo]" \autoBeamOff
      \once \omit Staff.TimeSignature
    R1*2 \bar "||"
    \time 2/2 f2 f4 f
    g2 e4 e
    d2 cis
    d c
    g' f4 f
    f2 e
    f c
    c c
    c f
  }
}

AltoLyrics = \lyricmode {
  e -- gre -- di --
  en -- tem de
  tem -- _
  plo a
  la -- te -- re
  dex -- _
  tro, al --
  le -- lu --
  ia, "al -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key d \minor \time 8/4 \tempoMarkup "[no tempo]" \autoBeamOff
      \once \omit Staff.TimeSignature
    R1*2 \bar "||"
    \time 2/2 d2 d4 d
    d2 e4 e
    a,1
    a2 a
    c c4 c
    c1
    c2 f
    e d
    c a
  }
}

TenoreLyrics = \lyricmode {
  e -- gre -- di --
  en -- tem de
  tem --
  plo a
  la -- te -- re
  dex --
  tro, al --
  le -- lu --
  ia, "al -"
}

Basso = {
  \relative c {
    \clef bass
    \key d \minor \time 8/4 \tempoMarkup "[no tempo]" \autoBeamOff
      \once \omit Staff.TimeSignature
    e\breve*1/8 f f d f e f e \bar "||"
    \time 2/2 d2 d4 d
    g2 g4 g
    a1
    d,2 f
    e f4 f
    c1
    f2 r
    R1
    r2 d
  }
}

BassoLyrics = \lyricmode {
  Vi -- _ di __ _ _ a -- _ quam
  e -- gre -- di --
  en -- tem de
  tem --
  plo a
  la -- te -- re
  dex --
  tro,

  "al -"
}

Organo = {
  \relative c {
    \clef bass
    \key d \minor \time 8/4 \tempoMarkup "[no tempo]"
      \once \omit Staff.TimeSignature
    e\breve*1/8 f f d f e f e \bar "||"
    \time 2/2 d2-\tutti d
    g g
    a1
    d,2 f
    e f
    c1
    f2 \clef tenor f'
    e d
    c \clef bass d,
  }
}

BassFigures = \figuremode {
  r4*8
  <_!>1
  r2 <8 6>
  <4> <3>
  r <3>
  <6 5> <3>
  <4> <3>
  r <3>
  <6> r
  r <3>
}

\score {
  <<
    \new ChoirStaff <<
      \new Staff {
        \set Staff.instrumentName = "S"
        \new Voice = "Soprano" { \dynamicUp \Soprano }
      }
      \new Lyrics \lyricsto Soprano \SopranoLyrics

      \new Staff {
        \set Staff.instrumentName = "A"
        \new Voice = "Alto" { \dynamicUp \Alto }
      }
      \new Lyrics \lyricsto Alto \AltoLyrics

      \new Staff {
        \set Staff.instrumentName = "T"
        \new Voice = "Tenore" { \dynamicUp \Tenore }
      }
      \new Lyrics \lyricsto Tenore \TenoreLyrics

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
