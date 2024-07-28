\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key a \major \time 3/4 \tempoMarkup "Andante"
    a'4 a a
    a2 a4
    fis' fis e~
    e8 fis e8. d16 d4\trill
    cis2 r4
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key a \major \time 3/4 \tempoMarkup "Andante"
    e4 e e
    fis2 fis4
    fis4. gis8 a4
    cis fis, h
    e,2 r4
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key a \major \time 3/4 \tempoMarkup "Andante" \autoBeamOff
    a'4 a a
    a2 a4
    fis' fis e~
    e8 fis e8.[ d16] d4\trill
    cis2 r4
  }
}

SopranoLyrics = \lyricmode {
  O sa -- lu --
  ta -- ris,
  sa -- lu -- ta --
  ris ho -- sti --
  a,
}

Alto = {
  \relative c' {
    \clef alto
    \key a \major \time 3/4 \tempoMarkup "Andante" \autoBeamOff
    e4 e e
    fis2 fis4
    fis4. gis8 a4
    cis fis, h
    e,2 r4
  }
}

AltoLyrics = \lyricmode {
  O sa -- lu --
  ta -- ris,
  sa -- lu -- ta --
  ris ho -- sti --
  a,
}

Tenore = {
  \relative c' {
    \clef tenor
    \key a \major \time 3/4 \tempoMarkup "Andante" \autoBeamOff
    cis4^\tutti cis cis
    cis2 a4
    a a a~
    a8 a a4 gis
    a2 r4
  }
}

TenoreLyrics = \lyricmode {
  O sa -- lu --
  ta -- ris,
  sa -- lu -- ta --
  ris ho -- sti --
  a,
}

Basso = {
  \relative c {
    \clef bass
    \key a \major \time 3/4 \tempoMarkup "Andante" \autoBeamOff
    a'4^\tutti a a8[ gis]
    fis2 fis8[ e]
    d4 d' cis
    a h e,
    a2 r4
  }
}

BassoLyrics = \lyricmode {
  O sa -- lu --
  ta -- ris,
  sa -- lu -- ta --
  ris ho -- sti --
  a,
}

Organo = {
  \relative c {
    \clef bass
    \key a \major \time 3/4 \tempoMarkup "Andante"
    a8-\tutti a'16 gis a8 cis a gis
    fis, fis'16 e fis8 a fis e
    d d'16 cis d8 d, cis cis'
    \grace h16 a8 gis16 a h8 h, e e,
    a a'16 gis a8 a, h cis
  }
}

BassFigures = \figuremode {
  r2.
  <5>
  r2 <6>4
  r <7> q
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
