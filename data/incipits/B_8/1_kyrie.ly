\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key e \major \time 6/4 \tempoMarkup "Ariosè"
    R1.*6
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key e \major \time 6/4 \tempoMarkup "Ariosè"
    R1.*6
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key e \major \time 6/4 \tempoMarkup "Ariosè" \autoBeamOff
    R1.*3
    h'2^\solo cis4 dis h e~
    e dis cis h2 a!4~
    a gis fis e2 fis4
  }
}

SopranoLyrics = \lyricmode {
  Ky -- ri -- e __ _ e --
  _ lei -- son, e --
  _ lei -- son, "e -"
}

Alto = {
  \relative c' {
    \clef alto
    \key e \major \time 6/4 \tempoMarkup "Ariosè" \autoBeamOff
    e2^\solo fis4 gis e a~
    a gis fis e2 a4~
    a gis fis e4. fis8[ gis ais]
    h4 r r r2 r4
    r2 r4 r r e,
    dis2 cis4 h e, r
  }
}

AltoLyrics = \lyricmode {
  Ky -- ri -- e __ _ e --
  _ lei -- son, e --
  _ _ lei -- _
  son,
  Chri --
  ste e -- lei -- son,
}

Tenore = {
  \relative c' {
    \clef tenor
    \key e \major \time 6/4 \tempoMarkup "Ariosè" \autoBeamOff
    R1.*2
    r4 r h2^\solo ais4 e'
    dis h r r2 r4
    R1.*2 %6
  }
}

TenoreLyrics = \lyricmode {
  Chri -- ste e --
  lei -- son,
}

Basso = {
  \relative c {
    \clef bass
    \key e \major \time 6/4 \tempoMarkup "Ariosè" \autoBeamOff
    R1.*6
  }
}

BassoLyrics = \lyricmode {

}

Organo = {
  \relative c {
    \clef bass
    \key e \major \time 6/4 \tempoMarkup "Ariosè"
    e8-\solo fis gis4 dis e gis cis
    h2 a gis4 fis
    e2 dis4 cis2.
    h8 cis dis4 ais h dis gis
    fis2 e dis4 cis
    h h' a!2 gis4 fis
  }
}

BassFigures = \figuremode {
  r2 r2. <6>4
  <7> <6> <6 3> <5 2> <6> <6\\>
  <4> <_+> r <7> <6\\>2
  r r2. <6>4
  <7 _+> <6\\ \t> <6 3> <5 2> <6> <6>
  <7> <6> q <5 2> <6> <6\\>
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
        \set Staff.instrumentName = "b"
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
