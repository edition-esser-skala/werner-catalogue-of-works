\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key a \major \time 4/4 \tempoMarkup "Andante"
    e'4 e a,16 gis a4.
    h16 cis d e fis d cis h cis a e' cis \appoggiatura gis'8 a4 \gotoBar "11"
    a,2\p a'4 a,
    h4. cis16 d cis4 a'
    h,4. cis16 d cis a e' cis a'8 a,
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key a \major \time 4/4 \tempoMarkup "Andante"
    cis'16 h cis8 cis16 h cis8 cis16 h cis8 e4
    fis,8 fis gis gis a cis16 a e4 \gotoBar "11"
    a4\p cis2 e4
    fis,8 fis gis gis a a e e
    fis fis gis gis a4 r
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key a \major \time 4/4 \tempoMarkup "Andante" \autoBeamOff
    R1*2 \gotoBar "11"
    e'4^\solo e a,16[ gis] a4.
    h16[ cis d e] fis[ d] cis[ h] \tuplet 3/2 8 { cis[ h a] } a4.
    h16[ cis d e] fis[ d] cis[ h] \tuplet 3/2 8 { cis[ h a] } a4.
  }
}

SopranoLyrics = \lyricmode {
  Da -- te ro -- sas,
  da -- _ te flo -- res,
  da -- _ te flo -- res,
}

Organo = {
  \relative c {
    \clef bass
    \key a \major \time 4/4 \tempoMarkup "Andante"
    a'8 a gis gis fis fis cis cis
    d d e e a a cis, cis \gotoBar "11"
    a'\p a gis gis fis fis cis cis
    d d e e a, a cis cis
    d d e e a e a, r
  }
}

BassFigures = \figuremode {
  r2 <5>4 <6>
  <6 5> <4>8 <3>4. <6>4
  r2 <5>4 <6>
  <6 5> <4>8 <3>4. <6>4
  <6 5> <4>8 <3>4 <\t>4.
}

\score {
  <<
    \new StaffGroup <<
      \new GrandStaff \with { \smallGroupDistance } <<
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
