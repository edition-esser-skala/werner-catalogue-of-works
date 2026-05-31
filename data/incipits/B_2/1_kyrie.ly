\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef soprano
    \key a \minor \time 4/4 \tempoMarkup "Allegro"
    R1*2
    r2 a'4. e'8
    d c h4 a8 c4 h16 a
    h4 e, r2
    r a4. e'8
  }
}

ViolinoII = {
  \relative c' {
    \clef soprano
    \key a \minor \time 4/4 \tempoMarkup "Allegro"
    R1*2
    r2 a'4. e'8
    d c h4 a8 c4 h16 a
    h4 e, r2
    r a4. e'8
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key a \minor \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
    R1*2
    r2 a'4.^\tutti e'8
    d c h4 a8 c4 h16[ a]
    h4 e, r2
    r a4. e'8
  }
}

SopranoLyrics = \lyricmode {
  Ky -- ri -- %3
  e e -- lei -- son, e -- _
  lei -- son,
  Ky -- "ri -"
}

Alto = {
  \relative c' {
    \clef alto
    \key a \minor \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
    R1
    r2 e4.^\tutti a8
    g g fis4 e r8 e
    fis16[ gis] a4 \hA gis8 a4 r8 a~
    a[ g16 fis] g8[ e] h' e, a[ g16 fis]
    g4 fis e8 a f[ e16 fis]
  }
}

AltoLyrics = \lyricmode {
  Ky -- ri -- %2
  e e -- lei -- son, e --
  lei -- _ _ son, e --
  lei -- son, e -- lei --
  _ _ son, e -- "lei -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key a \minor \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
    a4.^\tutti e'8 d c h4
    a c4. h16[ a] g8[ fis]
    e e'4 d c16[ h] c4
    h8 a d[ e] c a r a
    e'4. d16[ c] h8 h cis[ dis]
    e4 r r2
  }
}

TenoreLyrics = \lyricmode {
  Ky -- ri -- e e -- lei --
  son, e -- _ lei --
  son, e -- _ _ lei --
  son, e -- lei -- _ son, e --
  lei -- _ son, e -- lei --
  son,
}

Basso = {
  \relative c {
    \clef bass
    \key a \minor \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
    R1*4
    e4.^\tutti a8 g g fis4
    e8 e'4 d8 cis4 d8 c
  }
}

BassoLyrics = \lyricmode {
  Ky -- ri -- e e -- lei --
  son, e -- _ lei -- son, "e -"
}

Organo = {
  \relative c {
    \clef alto
    \key a \minor \time 4/4 \tempoMarkup "Allegro"
    a'4.-\tutti e'8 d c h4
    a4 << {
      s4 e'4. a8
      g4 fis
    } \\ {
      c4~ c8 h16 a g8 fis
      e e'4 d c16 h c4
    } >>
    h8 a d e c a r4
    \clef bass e4. a8 g g fis4
    e8 e'4 d8 cis4 d8 c
  }
}

BassFigures = \figuremode {
  <1>4. q8 r2
  r1
  r2 <5 2>4 <6>
  <6\\> <6 5>8 <_+> r2
  <5 4>4 <\t _!> <6> <7>8 <6\\>
  r <3> <2\+>2.
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
