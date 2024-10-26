\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key f \major \time 6/8 \tempoMarkup "Allegro"
      \once \omit Staff.TimeSignature
    s8*6 \bar "||"
    \time 4/4 c'4. d16 e f8 c a f
    d'8. es16 f8 \hA es16 d c b a b c8 b16 a
    g4 c2 c4
    b8 c d8. d16 c8 c4 f8
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key f \major \time 6/8 \tempoMarkup "Allegro"
      \once \omit Staff.TimeSignature
    s8*6 \bar "||"
    \time 4/4 r2 f4. g16 a
    b8 f d b f'16 g f g a8 g16 f
    e8 e4 f16 g a8 a4 a8
    f f4 f8 f e f a
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key f \major \time 6/8 \tempoMarkup "Allegro" \autoBeamOff
      \once \omit Staff.TimeSignature
    s8*6 \bar "||"
    \time 4/4 c'4. d16[ e] f8[ c] a[ f]
    d'8.[ es16] f8 \hA es16[ d] c[ b] a[ b] c8 b16[ a]
    g4 c2 c4
    b8[ c] d8. d16 c8 c4 f8
  }
}

SopranoLyrics = \lyricmode {
  Coe -- _ _ li __
  de -- _ su -- per, de -- _ su --
  per, coe -- li
  de -- _ su -- per, de -- "su -"
}

Alto = {
  \relative c' {
    \clef alto
    \key f \major \time 6/8 \tempoMarkup "Allegro" \autoBeamOff
      \once \omit Staff.TimeSignature
    s8*6 \bar "||"
    \time 4/4 r2 f4. g16[ a]
    b8[ f] d[ b] f'16[ g f g] a8 g16[ f]
    e8 e4 f16[ g] a8 a4 a8
    f f4 f8 f e[ f] a
  }
}

AltoLyrics = \lyricmode {
  Coe -- _
  _ li __ de -- _ su --
  per, de -- su -- per, de -- su --
  per, de -- su -- per, de -- "su -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key f \major \time 6/8 \tempoMarkup "Allegro" \autoBeamOff
      \once \omit Staff.TimeSignature
    s8*6 \bar "||"
    \time 4/4 R1*2
    c4. d16[ e] f8[ c] a[ f]
    d'[ c] b8. b16 a8 g[ a] c
  }
}

TenoreLyrics = \lyricmode {
  Coe -- _ _ li __
  de -- _ su -- per, de -- "su -"
}

Basso = {
  \relative c {
    \clef bass
    \key f \major \time 6/8 \tempoMarkup "Allegro" \autoBeamOff
      \once \omit Staff.TimeSignature
    c\breve*1/16 d d a' b a\fermata \bar "||"
    \time 4/4 R1*2
    r2 f4. g16[ a]
    b8[ f] d[ b] f'[ c a] f
  }
}

BassoLyrics = \lyricmode {
  Ro -- _ ra -- _ te __ _

  coe -- _
  _ li __ de -- "su -"
}

Organo = {
  \relative c {
    \clef bass
    \key f \major \time 6/8 \tempoMarkup "Allegro"
      \once \omit Staff.TimeSignature
    c\breve*1/16 d d a' b a\fermata \bar "||"
    \clef soprano \time 4/4 << {
      c'4. d16 e f8 c a b16 c
      d8 es f es16 d c b a b c8 b16 a
    } \\ {
      r2 f4. g16 a
      b8 f d b f'16 g f g a8 g16 f
    } >>
    \clef tenor c4. d16 e \clef bass f,4. g16 a
    b8 f d b f' c a f
  }
}

BassFigures = \figuremode {
  r8*6
  r1
  r
  r
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
