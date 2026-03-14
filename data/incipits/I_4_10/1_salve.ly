\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \major \time 4/4 \tempoMarkup "Presto"
    r4 d'4. cis8 d e
    fis d h cis d a d4~
    d cis d8 fis e d
    cis4 h8 a d h fis gis
    a4 r a4. h16 cis
    d4. cis16 h cis8 d e4~
    e d8 cis h4 e
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \major \time 4/4 \tempoMarkup "Presto"
    d2 e
    d4 g2 fis4
    e2 d8 a' g fis
    e a, a'4. gis8 a h
    cis a fis gis a e a4~
    a gis a2
    r4 fis g8 e h cis
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key d \major \time 4/4 \tempoMarkup "Presto" \autoBeamOff
    r4 d'4. cis8[ d e]
    fis[ d] h[ cis] d[ a] d4~
    d cis d8 fis e d
    cis4 h8 a d[ h fis gis]
    a4 r a4. h16[ cis]
    d4. cis16[ h] cis8[ d] e4~
    e d8 cis h4 e
  }
}

SopranoLyrics = \lyricmode {
  Sal -- _
  _ ve ma -- _
  _ ter mi -- se -- ri --
  cor -- di -- ae, sal --
  ve, sal -- _
  _ _ ve, sal --
  ve Re -- gi \hy
}

Alto = {
  \relative c' {
    \clef alto
    \key d \major \time 4/4 \tempoMarkup "Presto" \autoBeamOff
    d2 e
    d4 g2 fis4
    e2 d8 a' g fis
    e[ a,] a'4. gis8[ a h]
    cis[ a fis gis] a[ e] a4~
    a gis a2
    r4 fis g8[ e] h[ cis]
  }
}

AltoLyrics = \lyricmode {
  Re -- gi --
  na sal -- _
  _ ve, Re -- gi -- na
  sal -- _ _
  _ _ _
  _ ve,
  Re -- gi -- na
}

Tenore = {
  \relative c' {
    \clef tenor
    \key d \major \time 4/4 \tempoMarkup "Presto" \autoBeamOff
    R1*3
    a2 h
    a4 d2 cis4
    h2 a4. g!8
    fis d d'4. cis8[ d e]
  }
}

TenoreLyrics = \lyricmode {
  Re -- gi --
  na sal -- _
  _ ve, Re --
  gi -- na sal \hy
}

Basso = {
  \relative c {
    \clef bass
    \key d \major \time 4/4 \tempoMarkup "Presto" \autoBeamOff
    R1*6
    d2 e
  }
}

BassoLyrics = \lyricmode {
  Re -- "gi -"
}

Organo = {
  \relative c {
    \clef soprano
    \key d \major \time 4/4 \tempoMarkup "Presto"
    << {
      r4 d''4. cis8 d e
      fis d h cis d a d4~
      d cis d8 fis e d
    } \\ {
      d,2 e
      d4 g2 fis4
      e2 d8 a' g fis
    } >>
    \clef tenor a,2 h
    a4 d2 cis4
    h2 a4. g!8
    \clef bass d2 e
  }
}

BassFigures = \figuremode {
  r1
  r
  r
  r2 <7>4 <6\\>
  r <5 3> <\t 2>2
  <7>4 <6\\>2.
  <9>4 <8> <7> <6\\>
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
