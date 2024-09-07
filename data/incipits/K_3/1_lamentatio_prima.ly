\version "2.24.2"
\include "header.ly"

SopranoI = {
  \relative c' {
    \clef soprano
    \key b \major \time 4/4 \tempoMarkup "Largo" \autoBeamOff
    b'2^\solo c4. c8
    d4 d d d
    d d es c8 c
    b4 a b c
    c2 b4 r
  }
}

SopranoILyrics = \lyricmode {
  De la -- men --
  ta -- ti -- o -- ne
  Ie -- re -- mi -- ae Pro --
  phe -- _ _ _
  tae. __ _
}

SopranoII = {
  \relative c' {
    \clef soprano
    \key b \major \time 4/4 \tempoMarkup "Largo" \autoBeamOff
    r8 f^\solo b2 a4
    b b b b
    b8[ c] b[ a] g[ b] a g
    f4. g16[ a] b4 g8[ c]
    a b4 a8 b4 r
  }
}

SopranoIILyrics = \lyricmode {
  De la -- men --
  ta -- ti -- o -- ne
  Ie -- re -- mi -- ae Pro --
  phe -- _ _ _
  _ _ _ tae.
}

Alto = {
  \relative c' {
    \clef alto
    \key b \major \time 4/4 \tempoMarkup "Largo" \autoBeamOff
    r4 b^\solo f'4. f8
    b[ b,] d[ f] b,4 b'8[ a]
    g[ a] g[ f] es[ c] f es
    d[ b f' es] d[ g es c]
    f[ es f f,] b4 r
  }
}

AltoLyrics = \lyricmode {
  De la -- men --
  ta -- ti -- o -- ne
  Ie -- re -- mi -- ae Pro --
  phe -- _
  _ tae.
}

Cembalo = {
  \relative c' {
    \clef alto
    \key b \major \time 4/4 \tempoMarkup "Largo"
    b8 d4 b8 f' f, a f
    b b' d, f b, f' b a
    g a g f es c f es
    d b f' es d g es c
    f es f f, b d es f
  }
}

BassFigures = \figuremode {
  r2 <4>4 <6>
  r1
  r
  r
  <4>8 <5> <4> <3> r2
}


\score {
  <<
    \new ChoirStaff <<
      \new Staff {
        \set Staff.instrumentName = "S 1"
        \new Voice = "SopranoI" { \dynamicUp \SopranoI }
      }
      \new Lyrics \lyricsto SopranoI \SopranoILyrics

      \new Staff {
        \set Staff.instrumentName = "S 2"
        \new Voice = "SopranoII" { \dynamicUp \SopranoII }
      }
      \new Lyrics \lyricsto SopranoII \SopranoIILyrics

      \new Staff {
        \set Staff.instrumentName = "A"
        \new Voice = "Alto" { \dynamicUp \Alto }
      }
      \new Lyrics \lyricsto Alto \AltoLyrics
    >>
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = \markup \center-column { "vla" "cemb" }
        \Cembalo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
}
