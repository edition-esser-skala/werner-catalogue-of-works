\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key g \minor \time 4/4 \tempoMarkup "Allegretto"
    r16 d' fis a d a fis d r d, g b d a fis d
    r b d g b d g b r c a f c a f c
    r b' d f b f d b g b g b es, g c, es
    a, c' a c f, a d, f b, d' b d g, b es, g
    c, es' c es a, c f, a d, b'' f b d, f c f
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key g \minor \time 4/4 \tempoMarkup "Allegretto"
    r16 d' fis a d a fis d r d, g b d a fis d
    r b d g b d g b r c a f c a f c
    r b' d f b f d b g b g b es, g c, es
    a, c' a c f, a d, f b, d' b d g, b es, g
    c, es' c es a, c f, a d, b'' f b d, f c f
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key g \minor \time 4/4 \autoBeamOff \tempoMarkup "Allegretto"
    r4 r8 d' d d d d
    d4 r8 d c c f! c
    d4 r8 d g,4. a16[ g]
    a4. b16[ a] b4. c16[ b]
    c4. d16[ c] d8 d r c
  }
}

SopranoLyrics = \lyricmode {
  Ge -- lo -- bet ſey der
  Herr, der höch -- ſte Weld -- re --
  gent, der höch -- _
  _ _ _ _
  _ _ _ ſte, der
}

Alto = {
  \relative c' {
    \clef tenor
    \key g \minor \time 4/4 \autoBeamOff \tempoMarkup "Allegretto"
    r4 r8 fis g d d a
    b4 r8 d f f f, a
    b f b4. c16[ b] c4~
    c8[ d16 c] d4. es16[ d] es4~
    es8[ f16 es] f4. d8 r f
  }
}

AltoLyrics = \lyricmode {
  Ge -- lo -- bet ſey der
  Herr, der höch -- ſte Weld -- re --
  gent, der höch -- _ _
  _ _ _
  _ ſte, der
}

Tenore = {
  \relative c' {
    \clef tenor
    \key g \minor \time 4/4 \autoBeamOff \tempoMarkup "Allegretto"
    r4 r8 a b g a fis
    g4 r8 b c a16[ b] c8 a
    f4 r8 f g4. c8
    a4 r8 d b4 r8 es
    c4 r8 f, b b r c
  }
}

TenoreLyrics = \lyricmode {
  Ge -- lo -- bet ſey der
  Herr, der höch -- ſte Weld -- re --
  gent, der höch -- ſte
  Weld -- re -- gent, Re --
  gent, der höch -- ſte, der
}

Basso = {
  \relative c {
    \clef bass
    \key g \minor \time 4/4 \autoBeamOff \tempoMarkup "Allegretto"
    r4 r8 d g b fis d
    g4 r8 g a f16[ g] a8 f
    b4 r8 b, es4. f16[ es]
    f4. g16[ f] g4. a16[ g]
    a4. b16[ a] b8 b, r a'
  }
}

BassoLyrics = \lyricmode {
  Ge -- lo -- bet ſey der
  Herr, der höch -- ſte Weld -- re --
  gent, der höch -- _
  _ _ _ _
  _ _ _ ſte, der
}

BassoContinuo = {
  \relative c {
    \clef bass
    \key g \minor \time 4/4 \tempoMarkup "Allegretto"
    d8 d' fis, d g b fis d
    g d b g a f' a f
    b f d b es, es' c a
    f f' d b g g' es c
    a a' f d b d'16. c32 b8 a
  }
}

BassFigures = \figuremode {
  <_+>1
  r8 <\t>4. <6>2
  r8 <\t>2..
  r1
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
        \set Staff.instrumentName = "T 1"
        \new Voice = "Alto" { \dynamicUp \Alto }
      }
      \new Lyrics \lyricsto Alto \AltoLyrics

      \new Staff {
        \set Staff.instrumentName = "T 2"
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
        \set Staff.instrumentName = "bc"
        \BassoContinuo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
}
