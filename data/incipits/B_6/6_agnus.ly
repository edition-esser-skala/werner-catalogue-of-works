\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \major \time 4/4 \tempoMarkup "Largo"
    r2 fis'4.\p fis8
    fis d a d fis,4 r
    r8 a' a a r a, a a
    a( g) g4 r8 h h h
    h( ais) ais4 r2
    R1
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \major \time 4/4 \tempoMarkup "Largo"
    r2 d'4.\p d8
    d a fis a d,4 r
    r8 fis' fis fis r fis, fis fis
    h,4 r r8 gis' gis gis
    cis,!4 r r2
    R1
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key d \major \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    R1*4
    r2 r8 a'!4 a8
    a[ gis] gis4 r8 g4 g8
  }
}

SopranoLyrics = \lyricmode {
  Mi -- se --
  re -- re, mi -- "se -"
}

Alto = {
  \relative c' {
    \clef alto
    \key d \major \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    R1*4
    r8 e!4 e8 e[ dis] dis4
    r d8 d d[ cis] cis4
  }
}

AltoLyrics = \lyricmode {
  Mi -- se -- re -- re,
  mi -- se -- re -- re,
}

Tenore = {
  \relative c' {
    \clef tenor
    \key d \major \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    d4.^\solo d8 d[ a] fis a
    d,4 d r8 d16[ fis] fis[ a] a[ h]
    c4 a8 fis dis dis dis4
    e8 e' h g eis2
    fis4 r h4. fis'8
    fis e r4 a,4. e'8
  }
}

TenoreLyrics = \lyricmode {
  A -- gnus De -- i, qui
  tol -- lis pec -- ca -- ta
  mun -- di, pec -- ca -- ta mun --
  di, pec -- ca -- ta mun --
  di: Mi -- se --
  re -- re, mi -- "se -"
}

Basso = {
  \relative c {
    \clef bass
    \key d \major \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    R1*6
  }
}

BassoLyrics = \lyricmode {
}

Organo = {
  \relative c {
    \clef bass
    \key d \major \time 4/4 \tempoMarkup "Largo"
    d1~-\solo
    d~
    d2 dis
    e eis
    fis h,
    e! a,
  }
}

BassFigures = \figuremode {
  r1
  r
  <7>2 <7! 5>
  <6 4>8 <5 3>4. <7 5>2
  <8 6 4>8 \bc <7 5 _+>4. <8 4>8 <7 _+>4.
  <9 4>8 <8 _+> <7 \t>4 <8 4>8 <7 _+>4.
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
