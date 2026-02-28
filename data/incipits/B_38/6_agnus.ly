\version "2.24.2"
\include "header.ly"

ClarinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Largo"
    g''8 g4 g8 a a4 a8
    a4. a8 \pa g g4 g8
    f g \pd a4\trill g8 r r4
    R1*2
  }
}

ClarinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Largo"
    e'8 e4 e8 c c4 f8
    e4. f8 e4 c~
    c8 e f4\trill e8 r r4
    R1*2
  }
}

Timpani = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Largo"
    c8. c32 c c16 c c c c8 c16 c c8 r
    r4 r8 c c8. c32 c c16 c c c
    c8 c16 c c8 c c r r4
    R1*2
  }
}

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Largo"
    r8 g''16( e) c( g) e8 r a'16( f) c( a) f8
    r e16( a) cis( e) a8 r g16( e) c( e) g8
    a16 f e g f a c a g( c) h(\p d) c( a) g( f)
    e( g) f( a) g( e) d( c) h4 r
    e8. fis32 g a16 h c8 fis,8. g32 a h16 c d8
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Largo"
    r8 e'16( c) g( e) c8 r f'16( c) a( f) a8
    r cis,16( e) a8 c r e16( c) g( e) c( c')~
    c a g e' c f a f e8 d16(\p f) e( f) e( d)
    c( e) d( f) e( g) f( e) d4 r
    r8 e c a r fis' d h
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    c'4.^\tutti c8 a4 a8 d
    cis cis r c e4 g
    f8[ e] f4 e8 r r4
    r2 r8 h~^\solo^\aTre h16[ c] d8
    e[ c]~ c16[ d e8] fis[ d]~ d16[ e \hA fis8]
  }
}

SopranoLyrics = \lyricmode {
  A -- gnus De -- i, qui
  tol -- lis pec -- ca -- ta
  mun -- _ di:
  Mi -- se --
  re -- \hy
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    g'4.^\tutti g8 f4 f8 f
    e4 e8 a g4. c8
    a[ g] a4 g8 r r4
    r2 d4.^\solo^\aTre g8
    g e4 a fis h8~
  }
}

AltoLyrics = \lyricmode {
  A -- gnus De -- i, qui
  tol -- lis pec -- ca -- ta
  mun -- _ di:
  Mi -- se --
  re -- _ _ _ \hy
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    e4.^\tutti e8 c4 a8 a
    a4 a8 f' e[ g] c,4
    c2\trill c8 r r4
    r2 r4 g^\solo^\aTre
    c a d h
  }
}

TenoreLyrics = \lyricmode {
  A -- gnus De -- i, qui
  tol -- lis pec -- ca -- ta
  mun -- di:
  Mi --
  _ se -- re -- re,
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    c4.^\tutti c8 f4 f8 d
    a'4 a8 f c'4 e,
    f8[ c' a f] c r r4
    R1*2
  }
}

BassoLyrics = \lyricmode {
  A -- gnus De -- i, qui
  tol -- lis pec -- ca -- ta
  mun -- di:
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Largo"
    c4.-\tutti c8 f4. d8
    a'4. f8 c'4 e,
    f8 c a f c' r r4
    \clef tenor r2 g'-\solo-\aTre
    c4 a d h
  }
}

BassFigures = \figuremode {
  r1
  <_+>4. <5>8 r2
  r1
  r
  r2 <_+>
}

\score {
  <<
    \new StaffGroup <<
      \new Staff <<
        \set Staff.instrumentName = \markup \center-column { \transposedNameShort "clno" "C" "" "1, 2" }
        \partCombine #'(0 . 10) \ClarinoI \ClarinoII
      >>
    >>
    \new Staff {
      \set Staff.instrumentName = \transposedTimpShort "C" "" "G" ""
      \Timpani
    }
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
    \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16) }
}
