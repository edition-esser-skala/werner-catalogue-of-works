\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key b \major \time 3/4 \tempoMarkup "Allegro"
    d'16 es f es d8 f4 b8
    a f c a f4
    d'16 es f es d8 f b d
    c16 c a a f f c c a a f8
    R2.
    d''16 d b b g g d d b b g8
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key b \major \time 3/4 \tempoMarkup "Allegro"
    b'8 f b c d16 c d8
    c a4 f a8
    b f b c d16 es f8
    a16 a f f c c a a c c a8
    R2.
    b'16 b g g d d b b d d b8
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key b \major \time 3/4 \tempoMarkup "Allegro" \autoBeamOff
    d'4.^\tutti c8 b d
    c4 r r
    d4. c8 b d
    c4 c r
    r es8 es es es
    d4 d g,
  }
}

SopranoLyrics = \lyricmode {
  To -- ta pul -- chra
  es,
  pul -- chra es, Ma --
  ri -- a,
  et o -- ri -- gi --
  na -- lis, et
}

Alto = {
  \relative c' {
    \clef alto
    \key b \major \time 3/4 \tempoMarkup "Allegro" \autoBeamOff
    f4.^\tutti f8 f f
    f4 r r
    f4. f8 f f
    f4 f c
    fis8. fis16 fis8 fis fis fis
    g4 g r
  }
}

AltoLyrics = \lyricmode {
  To -- ta pul -- chra
  es,
  pul -- chra es, Ma --
  ri -- a, et
  ma -- cu -- la o -- ri -- gi --
  na -- lis,
}

Tenore = {
  \relative c' {
    \clef tenor
    \key b \major \time 3/4 \tempoMarkup "Allegro" \autoBeamOff
    b4. a8 b b
    a4 r r
    b4. a8 b b
    a4 a r
    r a8 a a a
    b4 b r
  }
}

TenoreLyrics = \lyricmode {
  To -- ta pul -- chra
  es,
  pul -- chra es, Ma --
  ri -- a,
  et o -- ri -- gi --
  na -- lis,
}

Basso = {
  \relative c {
    \clef bass
    \key b \major \time 3/4 \tempoMarkup "Allegro" \autoBeamOff
    b'4.^\tutti f8 d b
    f'4 r r
    b4. f8 d b
    f'4 f r
    r c8 c c c
    b4 b r
  }
}

BassoLyrics = \lyricmode {
  To -- ta pul -- chra
  es,
  pul -- chra es, Ma --
  ri -- a,
  et o -- ri -- gi --
  na -- lis,
}

Organo = {
  \relative c {
    \clef bass
    \key b \major \time 3/4 \tempoMarkup "Allegro"
    b'8-\tutti d16 c b8 f d b
    f' a16 g f8 f, a f'
    b d16 c b8 f d b
    f' f,16 f f8 f f4
    r c'8 c4 c8
    b4 b r
  }
}

BassFigures = \figuremode {
  r2.
  r
  r
  r
  r4 <4\+ _->4. \once \bassFigureExtendersOn q8
  <6>2.
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
