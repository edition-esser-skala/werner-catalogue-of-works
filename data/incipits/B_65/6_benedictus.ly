\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \dorian \time 3/4 \autoBeamOff \tempoMarkup "[no tempo]"
    R2.*4 \gotoBar "16"
    \time 4/2 \tempoMarkup "[no tempo]"
      \set Staff.timeSignatureFraction = 2/2
      R\breve*6
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \dorian \time 3/4 \autoBeamOff \tempoMarkup "[no tempo]"
    R2.*4 \gotoBar "16"
    \time 4/2 \tempoMarkup "[no tempo]"
      \set Staff.timeSignatureFraction = 2/2
      R\breve*6
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key d \dorian \time 3/4 \autoBeamOff \tempoMarkup "[no tempo]"
    R2.*4 \gotoBar "16"
    \time 4/2 \tempoMarkup "[no tempo]"
      \set Staff.timeSignatureFraction = 2/2
      R\breve*6
  }
}

SopranoLyrics = \lyricmode {
  %tacet
}

Alto = {
  \relative c' {
    \clef alto
    \key d \dorian \time 3/4 \autoBeamOff \tempoMarkup "[no tempo]"
    r4 f4. f8
    g4 g8[ f] g[ as]
    f4 f r
    r c2 \gotoBar "16"
    \time 4/2 \tempoMarkup "[no tempo]"
      \set Staff.timeSignatureFraction = 2/2
      R\breve*6
  }
}

AltoLyrics = \lyricmode {
  Be -- ne --
  di -- ctus, qui
  ve -- nit
  in
}

Tenore = {
  \relative c' {
    \clef tenor
    \key d \dorian \time 3/4 \autoBeamOff \tempoMarkup "[no tempo]"
    R2.
    r4 es4. es8
    es4 d8[ c] d[ \hA es]
    c4 c r \gotoBar "16"
    \time 4/2 \tempoMarkup "[no tempo]"
      \set Staff.timeSignatureFraction = 2/2
      R\breve*3
    a\breve
    d1 c
    h2 c d1
  }
}

TenoreLyrics = \lyricmode {
  Be -- ne --
  di -- ctus, qui
  ve -- nit,

  O --
  san -- na
  in ex -- "cel -"
}

Basso = {
  \relative c {
    \clef bass
    \key d \dorian \time 3/4 \autoBeamOff \tempoMarkup "[no tempo]"
    R2.*4 \gotoBar "16"
    \time 4/2 \tempoMarkup "[no tempo]"
      \set Staff.timeSignatureFraction = 2/2
      d\breve
    a'1 g
    e2 f g1
    d4 e f2. g4 a g
    f d f g a e a2~
    a4 g f e d c b2
  }
}

BassoLyrics = \lyricmode {
  O --
  san -- na
  in ex -- cel --
  _ _ _ _ _ _
  _ _ _ _ _ _ _
  _ _ _ _ _ \hy
}

Organo = {
  \relative c {
    \clef bass
    \key d \dorian \time 3/4 \tempoMarkup "[no tempo]"
    b4-\solo^\aDue d \hA b
    es g \hA es
    b d \hA b
    f f' es \gotoBar "16"
    \time 4/2 \tempoMarkup "[no tempo]"
      \set Staff.timeSignatureFraction = 2/2
      d\breve
    a'1 g
    e2 f g1
    << {
      a\breve
      d1 c
      h2 c d1
    } \\ {
      d,4 e f2. g4 a g
      f d f g a e a2~
      a4 g f e d c b2
    } >>
  }
}

BassFigures = \figuremode {
  r2.
  r
  <4>
  r
  <1>\breve
  q1 q
  q2 q q1
  r\breve
  r %20
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
        \set Staff.instrumentName =  \markup \center-column { "A" "trb 1" }
        \new Voice = "Alto" { \dynamicUp \Alto }
      }
      \new Lyrics \lyricsto Alto \AltoLyrics

      \new Staff {
        \set Staff.instrumentName =  \markup \center-column { "T" "trb 2" }
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
