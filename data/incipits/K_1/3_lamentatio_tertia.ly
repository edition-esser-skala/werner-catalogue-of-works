\version "2.24.2"
\include "header.ly"

SopranoI = {
  \relative c' {
    \clef soprano
    \key b \major \time 4/4 \autoBeamOff \tempoMarkup "Presto"
    d'1^\tutti
    c
    b2 c
    b r
    b^\solo c
    d4. d8 d4 d
  }
}

SopranoILyrics = \lyricmode {
  Io --
  _
  _ _
  d.
  Ma -- _
  _ num su -- am
}

SopranoII = {
  \relative c' {
    \clef soprano
    \key b \major \time 4/4 \autoBeamOff \tempoMarkup "Presto"
    r8 b[^\tutti d f] b[ f] b4~
    b8[ a16 g] a8[ b] c[ d] es4~
    es8[ d16 c] b2 a4
    b2 r
    b2.^\solo a4
    b2 b8[ f] g[ a]
  }
}

SopranoIILyrics = \lyricmode {
  Io -- _ _
  _ _ _
  _ _
  d.
  Ma -- _
  num su -- am
}

Alto = {
  \relative c' {
    \clef alto
    \key b \major \time 4/4 \autoBeamOff \tempoMarkup "Presto"
    r2 f~^\tutti
    f f4 a
    b2 g4 f
    f2 r
    R1*2
  }
}

AltoLyrics = \lyricmode {
  Iod, Io -- _
  _ _ _
  d.
}

Tenore = {
  \relative c' {
    \clef tenor
    \key b \major \time 4/4 \autoBeamOff \tempoMarkup "Presto"
    b4.^\tutti c8 d4 b
    c f,8[ g] a[ b c a]
    g4 r es' c
    d2 r
    R1*2
  }
}

TenoreLyrics = \lyricmode {
  Io -- _ _ _
  d, Io -- _
  d, Io -- _
  d.
}

Basso = {
  \relative c {
    \clef bass
    \key b \major \time 4/4 \autoBeamOff \tempoMarkup "Presto"
    b'4.^\tutti f8 d4 b
    f'2 r4 f
    g d es f
    b,2 r
    R1*2
  }
}

BassoLyrics = \lyricmode {
  Io -- _ _ _
  d, Io --
  _ _ _ _
  d.
}

Cembalo = {
  \relative c {
    \clef bass
    \key b \major \time 4/4 \tempoMarkup "Presto"
    b'4^\tutti b, d b
    f f' a f
    g d es f
    b,8 b'4 a16 g f8 es d c
    b4-\solo b' f2
    b8 b, b'4. c8 b a
  }
}

BassFigures = \figuremode {
  r1
  r
  <6>4 q <6 5>2
  r1
  r2 <4>4 <3>
  r1
}

\score {
  <<
    \new ChoirStaff <<
      \new Staff {
        \set Staff.instrumentName = "S 1"
        \new Voice = "SopranoI" { \dynamicUp \SopranoI }
      }
      \new Lyrics \lyricsto SopranoI \SopranoILyrics

      \new Staff {
        \set Staff.instrumentName = "S 2"
        \new Voice = "SopranoII" { \dynamicUp \SopranoII }
      }
      \new Lyrics \lyricsto SopranoII \SopranoIILyrics

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
        \set Staff.instrumentName = \markup \center-column { "cemb" "b" }
        \Cembalo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
}
