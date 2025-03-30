\version "2.24.2"
\include "header.ly"

Soprano = {
  \relative c' {
    \clef soprano
    \key f \major \time 3/2 \tempoMarkup "Andante" \autoBeamOff
    f2 g a4 c
    c1 a2
    b1 a2
    g1 r2
    f4 a c2 c4 d
    d2 c d4 f
    f1 e2
    d1 r2
  }
}

SopranoLyricsA = \lyricmode {
  Je -- su re -- _
  dem -- ptor
  o -- mni --
  um
  quem _ lu -- cis __ _
  an -- te o -- _
  ri -- gi --
  nem
}

SopranoLyricsB = \lyricmode {
  Je -- su ti -- _
  bi sit
  glo -- ri --
  a
  qui __ _ na -- tus __ _
  es __ _ de __ _
  vir -- gi --
  ne
}

Alto = {
  \relative c' {
    \clef alto
    \key f \major \time 3/2 \tempoMarkup "Andante" \autoBeamOff
    c2 e f
    c e f
    f g f
    e1 r2
    c g' f
    g a a4 gis
    a1 g2
    f1 r2
  }
}

AltoLyricsA = \lyricmode {
  Je -- su re --
  dem -- _ ptor
  o -- _ mni --
  um
  quem lu -- cis
  an -- te o -- _
  ri -- gi --
  nem
}

AltoLyricsB = \lyricmode {
  Je -- su ti --
  bi __ _ sit
  glo -- _ ri --
  a
  qui na -- tus
  es __ _ de __ _
  vir -- gi --
  ne
}

Tenore = {
  \relative c' {
    \clef tenor
    \key f \major \time 3/2 \tempoMarkup "Andante" \autoBeamOff
    a2 c c4 a
    g1 a2
    d c c
    c1 r2
    a g a4 b
    b2 a b4 d
    d1 cis2
    d1 r2
  }
}

TenoreLyricsA = \lyricmode {
  Je -- su re -- _
  dem -- ptor
  o -- _ mni --
  um
  quem lu -- cis __ _
  an -- te o -- _
  ri -- gi --
  nem
}

TenoreLyricsB = \lyricmode {
  Je -- su ti -- _
  bi sit
  glo -- _ ri --
  a
  qui na -- tus __ _
  es __ _ de __ _
  vir -- gi --
  ne
}

Basso = {
  \relative c {
    \clef bass
    \key f \major \time 3/2 \tempoMarkup "Andante" \autoBeamOff
    f2 c f
    e c f
    d e f
    c1 r2
    f e f
    e f b,
    a1 a2
    d1 r2
  }
}

BassoLyricsA = \lyricmode {
  Je -- su re --
  dem -- _ ptor
  o -- _ mni --
  um
  quem lu -- cis
  an -- te o --
  ri -- gi --
  nem
}

BassoLyricsB = \lyricmode {
  Je -- su ti --
  bi __ _ sit
  glo -- _ ri --
  a
  qui na -- tus
  es __ _ de
  vir -- gi --
  ne
}

Organo = {
  \relative c {
    \clef bass
    \key f \major \time 3/2 \tempoMarkup "Andante"
    f,2 c' f
    e c f
    d e f
    c1 r2
    f e f
    e f b,
    a a' a,
    d1 r2
  }
}

\score {
  <<
    \new ChoirStaff <<
      \new Staff {
        \set Staff.instrumentName = "S"
        \new Voice = "Soprano" { \dynamicUp \Soprano }
      }
      \new Lyrics \lyricsto Soprano \SopranoLyricsA
      \new Lyrics \lyricsto Soprano \SopranoLyricsB

      \new Staff {
        \set Staff.instrumentName = "A"
        \new Voice = "Alto" { \dynamicUp \Alto }
      }
      \new Lyrics \lyricsto Alto \AltoLyricsA
      \new Lyrics \lyricsto Alto \AltoLyricsB

      \new Staff {
        \set Staff.instrumentName = "T"
        \new Voice = "Tenore" { \dynamicUp \Tenore }
      }
      \new Lyrics \lyricsto Tenore \TenoreLyricsA
      \new Lyrics \lyricsto Tenore \TenoreLyricsB

      \new Staff {
        \set Staff.instrumentName = "B"
        \new Voice = "Basso" { \dynamicUp \Basso }
      }
      \new Lyrics \lyricsto Basso \BassoLyricsA
      \new Lyrics \lyricsto Basso \BassoLyricsB
    >>
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = \markup \center-column { "org" "b" }
        \Organo
      }
    >>
  >>
}
