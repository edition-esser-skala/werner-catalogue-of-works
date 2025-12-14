\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
      \key a \major \time 3/4 \tempoMarkup "[no tempo]"
      \once \override Staff.TimeSignature.style = #'single-digit
    R2.*4
    r8 e' a cis, h a
    gis16 e gis h e8 d, cis h
    cis16 a cis e a8 cis h a
    gis16 fis e8 r4 r
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
      \key a \major \time 3/4 \tempoMarkup "[no tempo]"
      \once \override Staff.TimeSignature.style = #'single-digit
    R2.*4
    r8 e' a cis, h a
    gis16 e gis h e8 d, cis h
    cis16 a cis e a8 cis h a
    gis16 fis e8 r4 r
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key a \major \time 3/4 \autoBeamOff \tempoMarkup "[no tempo]"
      \once \override Staff.TimeSignature.style = #'single-digit
    R2.*8
  }
}

SopranoLyrics = \lyricmode {
  %tacet
}

Alto = {
  \relative c' {
    \clef alto
    \key a \major \time 3/4 \autoBeamOff \tempoMarkup "[no tempo]"
      \once \override Staff.TimeSignature.style = #'single-digit
    e4^\solo a gis
    a2 e4
    fis2 e4~
    e8 fis d4. d8
    cis4 r r
    R2.*2
    r4 h e
  }
}

AltoLyrics = \lyricmode {
  Be -- a -- tus
  vir qui
  ti -- _
  met Do -- mi --
  num:

  In "man -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key a \major \time 3/4 \autoBeamOff \tempoMarkup "[no tempo]"
      \once \override Staff.TimeSignature.style = #'single-digit
    R2.*8
  }
}

TenoreLyrics = \lyricmode {
  %tacet
}

Basso = {
  \relative c {
    \clef bass
    \key a \major \time 3/4 \autoBeamOff \tempoMarkup "[no tempo]"
      \once \override Staff.TimeSignature.style = #'single-digit
    R2.*8
  }
}

BassoLyrics = \lyricmode {
  %tacet
}

Organo = {
  \relative c {
    \clef bass
    \key a \major \time 3/4 \tempoMarkup "[no tempo]"
      \once \override Staff.TimeSignature.style = #'single-digit
    a2-\solo h4
    cis a cis
    d2 cis4~
    cis h e
    a, cis d
    e4. fis8 gis4
    a4 fis dis
    e4. fis8 gis e
  }
}

BassFigures = \figuremode {
  r2.
  <6>
  r2 q4
  r <7> <7 _+>
  r <6>2
  r2.
  r2 <6>4
  r2.
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
