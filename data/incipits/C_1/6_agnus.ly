\version "2.24.2"
\include "header.ly"

TromboneI = {
  \relative c' {
    \clef alto
    \key c \dorian \time 4/4 \tempoMarkup "Largo"
    g'4.-\tutti g8 f2~
    f4 d8 f es16 d es8 r g
    es f16 g as4 f r8 d
    g4 g2 fis4
    g r r2
  }
}

TromboneII = {
  \relative c' {
    \clef tenor
    \key c \dorian \time 4/4 \tempoMarkup "Largo"
    es4.-\tutti c8 d2~
    d g,4 r8 c~
    c as4 f8 d'16( c) d8 r f
    h, d c d c4. h!16 a
    h4 r r2
  }
}

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \dorian \time 4/4 \tempoMarkup "Largo"
    c'4.-\tutti es8 as,2
    r8 g h d es g4 es8
    c4. d16 es f2~
    f8 g16 f es8 d es4~ es16 d es8
    \mvTr d16(\p-\solo g) fis( g) r f e( f) r es( d) es r es d( es)
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \dorian \time 4/4 \tempoMarkup "Largo"
    c'4.-\tutti es8 as,2
    r8 g h d es g4 es8
    c4. d16 es f2~
    f8 g16 f es8 d es4~ es16 d es8
    \mvTr d16(\p-\solo h) a( h) r d c( d) r c h!( c) r c h( c)
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \dorian \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    c'4.^\tutti es8 as,4 as
    r8 g h d es g4 es8
    c4. d16[ es] f2~
    f8[ g16 f] es8[ d] es4~ es16[ d es8]
    d4 r r2
  }
}

SopranoLyrics = \lyricmode {
  A -- gnus De -- i,
  De -- i, qui tol -- lis pec --
  ca -- _ _
  ta mun --
  di:
}

Alto = {
  \relative c' {
    \clef alto
    \key c \dorian \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    g'4.^\tutti g8 f2~
    f4 d8 f es16[ d] es8 r g
    es[ f16 g] as4 f r8 d
    g4 g g fis
    g r r2
  }
}

AltoLyrics = \lyricmode {
  A -- gnus De --
  i, qui tol -- lis pec --
  ca -- _ ta, pec --
  ca -- ta mun -- _
  di:
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \dorian \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    es4.^\tutti c8 d2~
    d g,4 r8 c
    c as4 f8 d'16[ c] d8 r f
    h,[ d] c[ d] c4. h!16[ a]
    h4 r r2
  }
}

TenoreLyrics = \lyricmode {
  A -- gnus De --
  i, qui
  tol -- lis pec -- ca -- ta, pec --
  ca -- ta mun -- _
  di:
}

Basso = {
  \relative c {
    \clef bass
    \key c \dorian \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    c2.^\tutti c4
    h2 c4 r8 c
    as'4 f d h
    g c8[ h] c2
    g4 r r2
  }
}

BassoLyrics = \lyricmode {
  A -- gnus
  De -- i, qui
  tol -- _ lis pec --
  ca -- ta mun --
  di:
}

Organo = {
  \relative c {
    \clef bass
    \key c \dorian \time 4/4 \tempoMarkup "Largo"
    c2~-\tutti c
    h c4 r8 c
    as'4 f d h
    g c8 h c2
    g8-\tasto r g r g r fis r
  }
}

BassFigures = \figuremode {
  r2 <6- 4 2>
  <6 5>1
  r2. <5>4
  <7>2 <3->4 <6 4\+>
  <_!>1
}

\score {
  <<
    \new StaffGroup <<
      \new GrandStaff <<
        \set GrandStaff.instrumentName = "trb"
        \new Staff {
          \set Staff.instrumentName = "1"
          \TromboneI
        }
        \new Staff {
          \set Staff.instrumentName = "2"
          \TromboneII
        }
      >>
    >>
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
