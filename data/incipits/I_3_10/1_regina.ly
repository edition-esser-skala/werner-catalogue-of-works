\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key a \major \time 4/4 \tempoMarkup "Andante"
    r2 r8 cis'\f cis'4~
    cis8 h16 a gis fis e d cis4 r
    r16 a'\p \tuplet 3/2 8 { a[ gis a] } a,4 r2
    r2 r8 \tuplet 3/2 8 { cis16 h cis } r8 \tuplet 3/2 8 { cis16 h cis }
    fis,8 r h64([ a) h16.] cis64( h) a16. gis16 gis8 gis16 gis8 e'
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key a \major \time 4/4 \tempoMarkup "Andante"
    r2 r8 a'\f a'4~
    a8 gis16 fis e d cis h a4 r
    r16 cis\p \tuplet 3/2 8 { cis[ h cis] } e8 cis r2
    r r8 \tuplet 3/2 8 { a16 gis a } r8 \tuplet 3/2 8 { a16 gis a }
    dis,8 r h'64([ a) h16.] cis64( h) a16. gis16 gis8 gis16 gis8 e'
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key a \major \time 4/4 \tempoMarkup "Andante" \autoBeamOff
    r8 a'^\solo cis16[ d] e8 a,16[ gis] a8 r4
    r2 r8 a cis16[ d] e8
    a,16[ gis] a8 r a d16[\trill cis] h[\trill a] gis[\trill fis] e[ d']
    cis a32[ h cis16 d] e[ d cis h] a32[\trill gis a8.] a32[\trill gis a8.]
    fis'64[ e dis16.] e64[ dis cis16.] h32[ a h8.] gis16[ h] h[ dis] e8 e,
  }
}

SopranoLyrics = \lyricmode {
  Re -- gi -- na coe -- li,
  Re -- gi -- na
  coe -- li, lae -- ta -- re, al -- le --
  lu -- ia, __ _ _ _
  al -- _ _ _ le -- lu -- ia,
}

Organo = {
  \relative c {
    \clef bass
    \key a \major \time 4/4 \tempoMarkup "Andante"
    a'4. gis8 fis4. cis8
    d4 e8 gis a4. gis8
    fis4 cis8 fis h, d e gis
    a, a' gis e fis e dis cis
    h cis dis h e dis cis gis'
  }
}

BassFigures = \figuremode {
  r2.. <6>8
  <7> <6>4 q2 r8
  r4 <6>4. q
  r4 q8 q4. <5>8 <\t>
  <7>4 <6 5>2.
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
