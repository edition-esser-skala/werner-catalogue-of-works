\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key a \minor \time 3/4 \tempoMarkup "Andante"
    R2.*9
    r4 h'\f h
    g'4. g8 g4
    r a, a
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key a \minor \time 3/4 \tempoMarkup "Andante"
    R2.*10
    r4 e\f e
    c'4. c8 c4
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key a \minor \time 3/4 \tempoMarkup "Andante" \autoBeamOff
    r4 r e'~^\solo
    e d c~
    c b a
    gis2 a4
    h!2 a4~
    a gis r
    R2.*3
    r4 h^\tutti h
    g'4. g8 g4
    r a, a
  }
}

SopranoLyrics = \lyricmode {
  Ky --
  ri -- e __
  e -- _
  lei -- son,
  e -- lei --
  son,

  Chri -- ste
  au -- di nos,
  Chri -- ste
}

Alto = {
  \relative c' {
    \clef alto
    \key a \minor \time 3/4 \tempoMarkup "Andante" \autoBeamOff
    R2.*5
    r4 r h'~^\solo
    h a g!~
    g f e
    dis2 e4~
    e8 fis \appoggiatura e4 dis2\trill
    e4 e^\tutti e
    c'4. c8 c4
  }
}

AltoLyrics = \lyricmode {
  Ky --
  ri -- e __
  e -- _
  lei -- son, __
  e -- lei --
  son, Chri -- ste
  au -- di nos,
}

Tenore = {
  \relative c' {
    \clef tenor
    \key a \minor \time 3/4 \tempoMarkup "Andante" \autoBeamOff
    R2.*6
    r4 e^\solo d
    c2 h4
    a h8[ a] g4
    c8[ a] \appoggiatura g4 fis2\trill
    e4 r r
    r e'^\tutti c
  }
}

TenoreLyrics = \lyricmode {
  Chri -- ste,
  Chri -- ste
  e -- lei -- son,
  e -- lei --
  son,
  Chri -- ste
}

Basso = {
  \relative c {
    \clef bass
    \key a \minor \time 3/4 \tempoMarkup "Andante" \autoBeamOff
    a'2^\solo g4
    f2 e4
    d4. e8 f4
    e2 r4
    r e c'~
    c h r
    R2.*2
    r4 fis e
    a h h,
    e g^\tutti e
    a4. a8 a4
  }
}

BassoLyrics = \lyricmode {
  Ky -- ri --
  e e --
  lei -- _ _
  son,
  e -- lei --
  son,

  Chri -- ste
  e -- lei -- _
  son, Chri -- ste
  au -- di nos,
}

Organo = {
  \relative c {
    \clef bass
    \key a \minor \time 3/4 \tempoMarkup "Andante"
    a'2\p g4
    f2 e4
    d2 f4
    e e' c
    gis a dis,
    e e' d!
    c2 h4
    a2 g!4
    fis h, e
    a, h2
    e4 g\f e
    a c a
  }
}

BassFigures = \figuremode {
  r2.
  <7>4 <6> q
  <7> <6-> <3>
  <_+> <\t> <6>
  q <9> <7 5>
  <6 4> <_+> <\t>
  <7> <6> <6>
  <7 ><6> q
  <6\\> <_+>2
  <6\\ 5>4 <6 4> <5\+ _+>
  <3>2.
  r
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
