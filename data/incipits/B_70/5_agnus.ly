\version "2.24.2"
\include "header.ly"

Soprano = {
  \relative c' {
    \clef soprano
    \key f \lydian \time 4/2 \tempoMarkup "[no tempo]" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    c'1. b4 a
    b2 d1 c4 h
    c2 c1 b2
    b a1 g2
    a1 r2 c!~
  }
}

SopranoLyrics = \lyricmode {
  A -- gnus _
  De -- i, qui _
  tol -- lis pec --
  ca -- ta mun --
  di: "Mi -"
}

Alto = {
  \relative c' {
    \clef alto
    \key f \lydian \time 4/2 \tempoMarkup "[no tempo]" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    f1 fis
    g gis2 gis
    a e fis g
    e f d4 cis d2
    cis1 r2 f~
  }
}

AltoLyrics = \lyricmode {
  A -- gnus
  De -- i, qui
  tol -- _ lis pec --
  ca -- ta mun -- _ _
  di: "Mi -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key f \lydian \time 4/2 \tempoMarkup "[no tempo]" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    a1. d2~
    d h! h e~
    e c d d
    c2. a4 f2 b
    e,1 r2 a~
  }
}

TenoreLyrics = \lyricmode {
  A -- gnus __
  De -- i, qui __
  tol -- lis pec --
  ca -- ta mun -- _
  di: "Mi -"
}

Basso = {
  \relative c {
    \clef bass
    \key f \lydian \time 4/2 \tempoMarkup "[no tempo]" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    f1 d
    g e2 e
    a1 d,2 g!
    c, f! b,1
    a r2 f'~
  }
}

BassoLyrics = \lyricmode {
  A -- gnus
  De -- i, qui
  tol -- lis pec --
  ca -- ta mun --
  di: "Mi -"
}

Organo = {
  \relative c {
    \clef bass
    \key f \lydian \time 4/2 \tempoMarkup "[no tempo]"
      \set Staff.timeSignatureFraction = 2/2
    f1 d
    g e2 e
    a1 d,2 g!
    c, f! b,1
    a r2 f'~
  }
}

BassFigures = \figuremode {
  r1 <7 _+>
  <_->2 <_!> <7 _+>1
  r <7 _+>2 <_->
  <7>1 <7>2 <6>
  <_+>1. r2
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
