\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key f \major \time 4/4 \tempoMarkup "Allegro"
    R1
    c'4. f8 e c d b~
    b a16 g a f a b c8 e, f16 g a h
    c4 c, r2
    g'4. c8 a g a f
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key f \major \time 4/4 \tempoMarkup "Allegro"
    R1
    c'4. f8 e c d b~
    b a16 g a f a b c8 e, f16 g a h
    c4 c, r2
    g'4. c8 a g a f
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key f \major \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
    R1
    c'4.^\tutti f8 e[ c] d[ b]~
    b[ a16 g] a[ f a b] c8 e, f16[ g a h]
    c4 c, r2
    g'4. c8 a g a[ f]
  }
}

SopranoLyrics = \lyricmode {
  Ky -- ri -- e __ e --
  lei -- son, e -- lei --
  _ son,
  Ky -- ri -- e e -- "lei -"
}

Alto = {
  \relative c' {
    \clef alto
    \key f \major \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
    R1*3
    g'4.^\tutti c8 a[ g] a[ f]~
    f[ e16 d] e8 c r e f16[ g a h]
  }
}

AltoLyrics = \lyricmode {
  Ky -- ri -- e __ e --
  lei -- son, e -- "lei -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key f \major \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
    c4.^\tutti f8 e[ c] d[ b]~
    b[ a16 g] a8 f r a b16[ c d e]
    f8 c f[ e16 d] c4. a8
    g[ c]~ c16[ b a g] f8[ e] d4
    c2 r4 r8 f'
  }
}

TenoreLyrics = \lyricmode {
  Ky -- ri -- e __ e --
  lei -- son, e -- lei --
  son, e -- lei -- son, e --
  lei -- _ _
  son, "e -"
}

Basso = {
  \relative c {
    \clef bass
    \key f \major \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
    R1*2
    f4.^\tutti c'8 a[ g] a[ f]~
    f[ e16 d] e8 c r e f16[ g a h]
    c4 c, r2
  }
}

BassoLyrics = \lyricmode {
  Ky -- ri -- e __ e --
  lei -- son, e -- lei --
  _ son,
}

Organo = {
  \relative c {
    \clef soprano
    \key f \major \time 4/4 \tempoMarkup "Allegro"
    << {
      s1
      c''4. f8 e c d b
    } \\ {
      \oneVoice c,4.-\tutti f8 e c d b~
      \voiceTwo b a16 g a8 f r a b16 c d e
    } >>
    \clef bass f,4. c'8 a g a f~
    f e16 d e8 c r e f16 g a h?
    c4 c, \clef alto << { a''8 g a16 g a h } \\ { r8 e, f4 } >>
  }
}

BassFigures = \figuremode {
  r1
  r
  <4>4 <3>8 <6> q q q4
  r1
  <4>4 <3>2.
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
        \set Staff.instrumentName = \markup \center-column { "A" "trb 1" }
        \new Voice = "Alto" { \dynamicUp \Alto }
      }
      \new Lyrics \lyricsto Alto \AltoLyrics

      \new Staff {
        \set Staff.instrumentName = \markup \center-column { "T" "trb 2" }
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
