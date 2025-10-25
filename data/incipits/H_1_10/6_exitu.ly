\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key f \major \time 4/4 \tempoMarkup "Allegro"
    r8 c' f2 e8 e
    f8. f16 f4 r8 f d h'
    c,4 r f4. g16 a
    b!8 b, r f' b8. a16 g4~
    g8 e c' a d b g c
    a4 r r2
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key f \major \time 4/4 \tempoMarkup "Allegro"
    f2 g4 g8 g
    a8. a16 a8 c a d4 d8
    g, c4 d16 e f8 f, a c
    f8. e16 d4. e16 f g8 f
    e g f2 e4
    f r r2
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key f \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
    f2^\tutti g4 g8 g
    a8. a16 a4 a8 a g4
    g8 c4 d16[ e] f8 f, r c'
    f8. e16 d2 c8 d
    e4 f2 e4
    f r r2
  }
}

SopranoLyrics = \lyricmode {
  In ex -- i -- tu
  Is -- ra -- el de Ae -- gy --
  pto do -- mus Ja -- cob de
  po -- pu -- lo, po -- pu --
  lo bar -- ba --
  ro.
}

Alto = {
  \relative c' {
    \clef alto
    \key f \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
    r8 c^\tutti f2 e8 e
    f8. f16 f4 f8 f d4
    c r f4. g16[ a]
    b8 b, r f' b8. a16 g4~
    g8 g a a g4. g8
    a4 c,8^\solo f e8. e16 f8 g
  }
}

AltoLyrics = \lyricmode {
  In ex -- i -- tu
  Is -- ra -- el de Ae -- gy --
  pto do -- mus
  Ja -- cob de po -- pu -- lo, __
  po -- pu -- lo bar -- ba --
  ro. Fa -- cta, fa -- cta est "Ju -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key f \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
    R1
    c2^\tutti d4 d8 d
    e8. e16 e4 r2
    r g,4. a16[ b]
    c8 c16 c c8 a16 a d4 c
    c r r2
  }
}

TenoreLyrics = \lyricmode {
  In ex -- i -- tu
  Is -- ra -- el
  do -- mus
  Ja -- cob de po -- pu -- lo bar -- ba --
  ro.
}

Basso = {
  \relative c {
    \clef bass
    \key f \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
    R1
    r8 g'^\tutti c2 h8 h
    c8. c16 c4 r2
    d,4. e16[ f] g8[ f] e d
    c4 a8 d b4 c
    f, r r2
  }
}

BassoLyrics = \lyricmode {
  In ex -- i -- tu %2
  Is -- ra -- el
  do -- mus Ja -- cob de
  po -- pu -- lo bar -- ba --
  ro.
}

Organo = {
  \relative c {
    \clef bass
    \key f \major \time 4/4 \tempoMarkup "Allegro"
    f8-\tutti g a d b g c b
    a g f e f d g f
    e d c b << { a' g f es } \\ { a,4 } >>
    d8 c b a g' f e d
    c c' a d b g c c,
    f g a-\solo f c' b a g
  }
}

BassFigures = \figuremode {
  r2 <6 5>
  r <6 5>4 <_!>
  r1
  <6>
  r2 <6 5>
  r1
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
