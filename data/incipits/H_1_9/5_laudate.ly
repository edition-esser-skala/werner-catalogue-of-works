\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key a \minor \time 4/2 \tempoMarkup "Alla capella"
      \set Staff.timeSignatureFraction = 2/2
    R\breve*2
    r2
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key a \minor \time 4/2 \tempoMarkup "Alla capella"
      \set Staff.timeSignatureFraction = 2/2
    R\breve
    a'1 e4 f e d
    c h
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key a \minor \time 4/2 \autoBeamOff \tempoMarkup "Alla capella"
      \set Staff.timeSignatureFraction = 2/2
    R\breve*2
    r2
  }
}

Alto = {
  \relative c' {
    \clef alto
    \key a \minor \time 4/2 \autoBeamOff \tempoMarkup "Alla capella"
      \set Staff.timeSignatureFraction = 2/2
    R\breve
    a'1 e4 f e d
    c h
  }
}

AltoLyrics = \lyricmode {
  Lau -- da -- _ te __ _
  "Do -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key a \minor \time 4/2 \autoBeamOff \tempoMarkup "Alla capella"
      \set Staff.timeSignatureFraction = 2/2
    r2 a a gis
    a4 h c a h2 h4 h
    a2.*2/3
  }
}

TenoreLyrics = \lyricmode {
  Lau -- da -- te
  Do -- _ _ _ _ mi -- num,
  "Do -"
}


Basso = {
  \relative c {
    \clef bass
    \key a \minor \time 4/2 \autoBeamOff \tempoMarkup "Alla capella"
      \set Staff.timeSignatureFraction = 2/2
    a'1 e4 f e d
    c h a1 gis2
    a
  }
}

BassoLyrics = \lyricmode {
  Lau -- da -- _ te __ _
  Do -- _ _ mi --
  num,
}

Organo = {
  \relative c {
    \clef bass
    \key a \minor \time 4/2 \tempoMarkup "Alla capella"
      \set Staff.timeSignatureFraction = 2/2
    a'1 e4 f e d
    c h a1 gis2
    a
  }
}

BassFigures = \figuremode {
  r1 <4>2 <_+>
  r <3> <4 2>1
  r2
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
