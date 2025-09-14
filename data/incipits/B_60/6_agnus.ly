\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key a \major \time 4/4 \tempoMarkup "Largo"
    cis'1~
    cis2 h
    c h~
    h ais4 fis'8 e
    fis2 h,8 e c f
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key a \major \time 4/4 \tempoMarkup "Largo"
    e4. a8 fis4 e~
    e e d2
    fis g
    eis fis4 d'8 cis
    d4 h gis! a
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key a \major \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    a'4.^\solo cis8 fis,[ ais] cis e
    g,4 g8 fis d d r d'
    dis4 dis8 fis e4 e,
    eis2\trill fis4 r
    a8 a d fis, gis! gis a4~
  }
}

SopranoLyrics = \lyricmode {
  A -- gnus De -- i, qui
  tol -- lis pec -- ca -- ta, pec --
  ca -- ta, pec -- ca -- ta
  mun -- di:
  Mi -- se -- re -- re, mi -- se -- "re -"
}

Organo = {
  \relative c {
    \clef bass
    \key a \major \time 4/4 \tempoMarkup "Largo"
    a2-\solo ais~
    ais h4 h'
    a!2 g
    gis fis4. a8
    d,2 e4 f
  }
}

BassFigures = \figuremode {
  r2 <6>4 <5>
  <7! 5>1
  <4\+ _!>2 <6>
  <6\\> <_+>4 <6 _!>8 <_+>
  <5>4 <6> <_+> <5>
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
