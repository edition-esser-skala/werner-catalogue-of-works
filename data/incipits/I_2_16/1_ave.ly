\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key a \minor \time 4/4 \tempoMarkup "Allegro"
    e2 a4 h
    c2 h4 h
    a d2 c4~
    c h2 a4~
    a gis a g8 f
    e2 d4 r
    R1*2
    a'2 d4 e
    f2 e4 e
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key a \minor \time 4/4 \tempoMarkup "Allegro"
    R1
    a2 d4 e
    f2 e4 e
    d2 c
    h c4 r
    c2 f4 g
    a2 g4 g
    f e d e~
    e a2 g!4
    f2 g4 g
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key a \minor \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
    e2 a4 h
    c2 h4 h
    a d2 c4~
    c h2 a4~
    a gis a g8[ f]
    e2 d4 r
    R1*2
    a'2 d4 e
    f2 e4 e
  }
}

SopranoLyrics = \lyricmode {
  A -- ve Re --
  gi -- na coe --
  lo -- _ _
  _ _
  _ _ _
  _ rum:

  Sal -- ve _
  ra -- dix, "sal -"
}

Alto = {
  \relative c' {
    \clef alto
    \key a \minor \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
    R1
    a2 d4 e
    f2 e4 e
    d2 c
    h c4 r
    c2 f4 g
    a2 g4 g
    f e d e~
    e a2 g!4
    f2 g4 g
  }
}

AltoLyrics = \lyricmode {
  A -- ve Re --
  gi -- na coe --
  lo -- _
  _ rum,
  a -- ve _
  Do -- mi -- na
  An -- ge -- lo -- _
  _ _
  _ rum, "An -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key a \minor \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
    R1*4
    e,2 a4 h
    c2 h4 h
    a d2 cis4
    d c h2
    c4. h8 a4 cis
    d2 c4 c
  }
}

TenoreLyrics = \lyricmode {
  A -- ve Re --
  gi -- na coe --
  lo -- _ _
  _ _ _
  rum, a -- ve Do --
  _ mi -- na
}

Basso = {
  \relative c {
    \clef bass
    \key a \minor \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
    R1*5
    a2 d4 e
    f2 e4 e
    d a'2 gis4
    a4. g8 f4 e
    d2 e4 c
  }
}

BassoLyrics = \lyricmode {
  A -- ve Re --
  gi -- na coe --
  lo -- _ _
  _ _ _ _
  _ rum, "coe -"
}

Organo = {
  \relative c {
    \clef soprano
    \key a \minor \time 4/4 \tempoMarkup "Allegro"
    e'2-! a4-! h-!
    \clef alto a,2 d4 e
    f2 e
    d c
    \clef tenor e, a4 h
    \clef bass a,2 d4 e
    f2 e
    d4 a'2 gis4
    a4. g8 f4 e
    d2 e4 c
  }
}

BassFigures = \figuremode {
  r1
  r2 <6>4 <5>
  <3> <6> <7> <6>
  <7> <6> <7> <6>
  <4> <3>2 <6>8 <5>
  r2 <6>
  <3>4 <6> <7> <6\\>
  r <3> <2> <3>
  r2 <6>4 <6\\>
  r2 <6>
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
