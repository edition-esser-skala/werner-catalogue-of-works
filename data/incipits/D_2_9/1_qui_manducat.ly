\version "2.24.2"
\include "header.ly"

ClarinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Largo"
    g''4 r8 g a4 r8 \pa a
    g4. g8 f a g f
    e e16 e \pd e8 r r2
    R1
    r2 c8 c16 c c8 c
    c c16 c c c c c c8 r r4
  }
}

ClarinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Largo"
    e'4 r8 e f4 r8 f~
    f4 e d8 f e d~
    d g,16 g c8 r r2
    R1
    r2 c,8 c16 c c8 c
    c e16 c e e g g c,8 r r4
  }
}

Timpani = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Largo"
    c4 r8 c c4 r8 c
    c c16 c c8 c c c g g
    c c16 c c8 r r2
    R1
    r2 c8 c16 c c8 c
    c c16 c c c c c c8 r r4
  }
}

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Largo"
    <c' e, g,>8 c[\trill e\trill g]\trill r c,\trill f\trill a\trill
    r c,\trill e\trill g\trill r f\trill e\trill d\trill
    r c\trill e\trill g\trill r a,\trill cis\trill e\trill
    r d\trill f\trill a\trill r d,\trill fis\trill a\trill
    r g\trill b\trill d\trill c32( g16.) e32( c16.) a32( c16.) f32( a16.)
    g32( e16.) c32( g16.) e'32( c16.) g32( e16.) c8 e'([\p f h,!)]
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Largo"
    <g e' c'>8 e'[\trill g\trill c]\trill r a\trill c\trill f\trill
    r g,\trill c\trill e\trill r a,\trill g\trill f\trill
    r e\trill g\trill c\trill r a\trill e\trill cis\trill
    r f\trill a\trill c!\trill r d\trill a\trill fis\trill
    r b\trill d\trill \hA b\trill g32 g'16. e32 c16. a32 c16. a32 f'16.
    e32 c16. g32 e16. c'32 g16. e32 c16. c8 b'([\p a f)]
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 4/4 \tempoMarkup "Largo" \autoBeamOff
    g'4. c8 c2
    c4 c d2~
    d8 c16[ h] c8 e c c cis cis
    d d r c d4 d
    d4. d8 c4 c
    c2 r
  }
}

SopranoLyrics = \lyricmode {
  Qui man -- du --
  cat, man -- du --
  cat, qui man -- du -- cat me -- am
  car -- nem et bi -- bit
  me -- um san -- gui --
  nem,
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 4/4 \tempoMarkup "Largo" \autoBeamOff
    e4. g8 a2
    g4 g f8[ a g f]
    e e4 g8 a a e e
    f f r f f f fis fis
    g2. f4
    e2 r
  }
}

AltoLyrics = \lyricmode {
  Qui man -- du --
  cat, man -- du --
  cat, qui man -- du -- cat me -- am
  car -- nem et bi -- bit me -- um
  san -- gui --
  nem,
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/4 \tempoMarkup "Largo" \autoBeamOff
    c4. e8 f[ c] f4~
    f e d2
    g,8 g4 c8 c a a a
    a a r a b b a a
    b2. a4
    g2 r
  }
}

TenoreLyrics = \lyricmode {
  Qui man -- du -- cat, __
  man -- du --
  cat, qui man -- du -- cat me -- am
  car -- nem et bi -- bit me -- um
  san -- gui --
  nem,
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Largo" \autoBeamOff
    c4. c8 c2
    c4 c c h
    c c8 c f f a a
    d, d r f b, b r d
    g, g g' g e4 f
    c2 r
  }
}

BassoLyrics = \lyricmode {
  Qui man -- du --
  cat, man -- du -- _
  cat, qui man -- du -- cat me -- am
  car -- nem, et bi -- bit, et
  bi -- bit me -- um san -- gui --
  nem,
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Largo"
    c2~-\tutti c~
    c2. h4
    c4. c8 f f a a
    d, d f f b, b d d
    g, g g' g e e f f
    c c c c c r r4
  }
}

BassFigures = \figuremode {
  r2 <6 4>
  <5 4>4 <\t 3> <4 2> <6>8 <5>
  <9> <8>4. <5>4 <_+>
  r <5> <5> <_+>
  <_->2 <6 5->
  r1
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
        \set GrandStaff.instrumentName = "S"
        \new Voice = "Soprano" { \dynamicUp \Soprano }
      }
      \new Lyrics \lyricsto Soprano \SopranoLyrics

      \new Staff {
        \set GrandStaff.instrumentName = "A"
        \new Voice = "Alto" { \dynamicUp \Alto }
      }
      \new Lyrics \lyricsto Alto \AltoLyrics

      \new Staff {
        \set GrandStaff.instrumentName = "T"
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
