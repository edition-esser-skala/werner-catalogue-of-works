\version "2.24.2"
\include "header.ly"

Soprano = {
  \relative c' {
    \clef soprano
    \key g \major \time 4/4 \tempoMarkup "Presto" \autoBeamOff
    d'4 e d8 g, c4
    h8 d4 c16[ h] a8 d4 cis8
    d h4 a8 h4 r
    r2 a4 h
    a8 d, g4 fis2
  }
}

SopranoLyrics = \lyricmode {
  Hic est pa -- nis vi --
  vus, pa -- nis vi -- _ _
  vus, pa -- _ nis,
  hic est
  pa -- nis vi -- vus,
}

Alto = {
  \relative c' {
    \clef alto
    \key g \major \time 4/4 \tempoMarkup "Presto" \autoBeamOff
    r2 g'4 a
    g8 d g4 fis g
    fis8 g e[ fis] g4. g8
    a fis d[ e] fis fis d4(
    e8) fis h,[ cis] d4 r8 d
  }
}

AltoLyrics = \lyricmode {
  Hic est
  pa -- nis vi -- vus, est
  pa -- nis vi -- vus, est
  pa -- nis vi -- vus, est pa --
  nis vi -- vus, hic
}

Tenore = {
  \relative c' {
    \clef tenor
    \key g \major \time 4/4 \tempoMarkup "Presto" \autoBeamOff
    R1
    r2 d4 e
    d8 g, c!4 h8 d4 d8
    cis d h[ cis] d4. h8
    cis a g4 a8 a h4
  }
}

TenoreLyrics = \lyricmode {
  Hic est
  pa -- nis vi -- vus, pa -- nis,
  pa -- nis vi -- vus, est
  pa -- nis vi -- vus, hic est
}

Basso = {
  \relative c {
    \clef bass
    \key g \major \time 4/4 \tempoMarkup "Presto" \autoBeamOff
    R1*2
    r2 g'4 h
    a8 d, g4 fis g~
    g8 fis e4 d r
  }
}

BassoLyrics = \lyricmode {
  Hic est
  pa -- nis vi -- vus, pa --
  nis vi -- vus,
}

Organo = {
  \relative c {
    \clef soprano
    \key g \major \time 4/4 \tempoMarkup "Presto"
    << {
      d''4 e d8 g, c4
      h8 d~ d c16 h
    } \\ {
      r2 g4 a
      g8 d g4
    } >> \clef tenor d e
    d8 g, c!4 \clef bass g h
    a8 d, g4 fis g~
    g8 fis e4 d8 \noBeam \clef tenor a' h4
  }
}

BassFigures = \figuremode {
  r1
  r2 <5>4 <7>8 <6\\>
  r4 <7>8 <6>4. <6>4
  <_+> <5>8 <6\\> <6>2
  <4\+ 2>8 <6> <5> <6\\> r4 <5>
}

\score {
  <<
    \new ChoirStaff <<
      \new Staff {
        \set Staff.instrumentName = \markup \center-column { "S" "vl 1" }
        \new Voice = "Soprano" { \dynamicUp \Soprano }
      }
      \new Lyrics \lyricsto Soprano \SopranoLyrics

      \new Staff {
        \set Staff.instrumentName = \markup \center-column { "A" "vl 2" }
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
